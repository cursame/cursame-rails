class AddPersonalizeDomainToNetwork < ActiveRecord::Migration
  def change
    add_column :networks, :personalize_domain, :string

  end
end
