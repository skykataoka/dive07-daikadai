class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text "contents"
      t.timestamps null: false
    end
  end
end
