package ERP::Inventory::Sync;

use strict;
use warnings;

use Moo;

=head1 NAME

ERP::Inventory::Sync

=head1 DESCRIPTION

This module provides inventory sync capabilities for the erp and angler schemas.

=head1 SYNOPSIS

    # run an inventory sync test only
    my $inventory_sync = ERP::Sync::Inventory->new(
        schema_erp => $schema_erp,
        schema_angler => $schema_angler,
        testing => 1,
        export_dir => $export_dir
    );

    $inventory_sync->run;

=cut

=head2 schema_angler

L<Angler::Interchange6::Schema> object.

=cut

has schema_angler => (
    is => 'ro',
    required => 1,
);

=head2 schema_erp

L<ERP::Schema> object.

=cut

has schema_erp => (
    is => 'ro',
    required => 1,
);

=head2 testing

Returns sync type

=cut

has testing => (
    is => 'ro',
);

=head2 export_dir

Returns the export directory

=cut

has export_dir => (
    is => 'ro',
);

=head2 run;

=cut

sub run {
    my ($self) = @_;
    my ($tokens, $c, $u);
    my $schema_erp = $self->schema_erp;
    my $schema_angler = $self->schema_angler;

    # select all records from InventoryItem
    my $inventory_item_rs = $schema_erp->resultset('ItemInventory');

    while (my $inventory_item = $inventory_item_rs->next) {
        my ($inventory, $query, $product);
        my $gtin = $inventory_item->upc;
        my $msku = $inventory_item->alu;

        if ( defined $gtin ) {
            $query = { gtin => $gtin };
        }

        if ( defined $msku ) {
            if ( $query ) {
                $query = { -or => [
                                      $query, { manufacturer_sku => $msku }
                                  ]
                         }
            }
            else {
                $query = { manufacturer_sku => $msku }
            }
        }
#        print "skipping item ", $ unless $query;
        $product =  
            $schema_angler->resultset('Product')->search( $query, { rows => 1 } )->single if $query;

        $c = 0; # created
        $u = 0; # updated

        if ($product) {
            unless ($self->testing) {
                $inventory =  $schema_angler->resultset('Inventory')->update_or_new(
                    {
                        sku => $product->sku,
                        quantity => $inventory_item->quantityonhand
                    },
                );
            }
            else {
                 $inventory =  $schema_angler->resultset('Inventory')->find_or_new(
                    {
                        sku => $product->sku,
                        quantity => $inventory_item->quantityonhand
                    },
                );
            }

            if ($inventory->in_storage) {
                $u++;
                print "sku ", $product->sku, " was updated to quantity", $inventory_item->quantityonhand, "\n";
            }
            else {
                $c++;
                print "sku ", $product->sku, " inventory was added \n";
                $inventory->insert unless $self->testing;
            }
        }
    }

    $tokens->{created} = $c;
    $tokens->{updated} = $u;

    return $tokens

};

=head2 clear;

Sets exisiting inventory for all Inventory records to 0 

=cut

sub clear {
    my ($self) = @_;
    my $schema_angler = $self->schema_angler;
    my $inventory =  $schema_angler->resultset('Inventory')->update({
                                                quantity => '0'
                                            });
}

1;
