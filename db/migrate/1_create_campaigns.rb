class CreateCampaigns < ActiveRecord::Migration

  def self.up
    create_table :campaigns do |t|
      t.string :title
      t.text :body
      t.integer :position

      t.timestamps
    end

    add_index :campaigns, :id

    load(Rails.root.join('db', 'seeds', 'campaigns.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Campaigns"})

    Page.delete_all({:link_url => "/campaigns"})

    drop_table :campaigns
  end

end
