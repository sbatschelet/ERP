use utf8;
package ERP::Schema::Result::InventoryQtyAdjustment;

=head1 NAME

ERP::Schema::Result::InventoryQtyAdjustment - Insert Only Inventory Qty Adjustment Item Table

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<InventoryQtyAdjustment>

=cut

__PACKAGE__->table("InventoryQtyAdjustment");

=head1 ACCESSORS

=head2 txnid

  data_type: 'varchar'
  is_nullable: 0
  size: [36,0]

=head2 timecreated

  data_type: 'timestamp'
  is_nullable: 1
  size: [23,3]

=head2 timemodified

  data_type: 'timestamp'
  is_nullable: 1
  size: [23,3]

=head2 associate

  data_type: 'varchar'
  is_nullable: 1
  size: [40,0]

=head2 comments

  data_type: 'varchar'
  is_nullable: 1
  size: [300,0]

=head2 costdifference

  data_type: 'decimal'
  is_nullable: 1
  size: [14,5]

=head2 historydocstatus

  data_type: 'varchar'
  is_nullable: 1
  size: [9,0]

=head2 inventoryadjustmentnumber

  data_type: 'integer'
  is_nullable: 1
  size: [10,0]

=head2 inventoryadjustmentsource

  data_type: 'varchar'
  is_nullable: 1
  size: [17,0]

=head2 itemscount

  data_type: 'integer'
  is_nullable: 1
  size: [10,0]

=head2 newquantity

  data_type: 'decimal'
  is_nullable: 1
  size: [13,5]

=head2 oldquantity

  data_type: 'decimal'
  is_nullable: 1
  size: [13,5]

=head2 quickbooksflag

  data_type: 'varchar'
  is_nullable: 1
  size: [17,0]

=head2 reason

  data_type: 'varchar'
  is_nullable: 1
  size: [8,0]

=head2 storeexchangestatus

  data_type: 'varchar'
  is_nullable: 1
  size: [17,0]

=head2 storenumber

  data_type: 'integer'
  is_nullable: 1
  size: [10,0]

=head2 txndate

  data_type: 'date'
  is_nullable: 1
  size: [10,0]

=head2 txnstate

  data_type: 'varchar'
  is_nullable: 1
  size: [6,0]

=head2 workstation

  data_type: 'integer'
  is_nullable: 1
  size: [10,0]

=head2 fqsavetocache

  data_type: 'bit'
  is_nullable: 1
  size: [1,0]

=cut

__PACKAGE__->add_columns(
  "txnid",
  { data_type => "varchar", is_nullable => 0, size => [36, 0] },
  "timecreated",
  { data_type => "timestamp", is_nullable => 1, size => [23, 3] },
  "timemodified",
  { data_type => "timestamp", is_nullable => 1, size => [23, 3] },
  "associate",
  { data_type => "varchar", is_nullable => 1, size => [40, 0] },
  "comments",
  { data_type => "varchar", is_nullable => 1, size => [300, 0] },
  "costdifference",
  { data_type => "decimal", is_nullable => 1, size => [14, 5] },
  "historydocstatus",
  { data_type => "varchar", is_nullable => 1, size => [9, 0] },
  "inventoryadjustmentnumber",
  { data_type => "integer", is_nullable => 1, size => [10, 0] },
  "inventoryadjustmentsource",
  { data_type => "varchar", is_nullable => 1, size => [17, 0] },
  "itemscount",
  { data_type => "integer", is_nullable => 1, size => [10, 0] },
  "newquantity",
  { data_type => "decimal", is_nullable => 1, size => [13, 5] },
  "oldquantity",
  { data_type => "decimal", is_nullable => 1, size => [13, 5] },
  "quickbooksflag",
  { data_type => "varchar", is_nullable => 1, size => [17, 0] },
  "reason",
  { data_type => "varchar", is_nullable => 1, size => [8, 0] },
  "storeexchangestatus",
  { data_type => "varchar", is_nullable => 1, size => [17, 0] },
  "storenumber",
  { data_type => "integer", is_nullable => 1, size => [10, 0] },
  "txndate",
  { data_type => "date", is_nullable => 1, size => [10, 0] },
  "txnstate",
  { data_type => "varchar", is_nullable => 1, size => [6, 0] },
  "workstation",
  { data_type => "integer", is_nullable => 1, size => [10, 0] },
  "fqsavetocache",
  { data_type => "bit", is_nullable => 1, size => [1, 0] },
);


1;
