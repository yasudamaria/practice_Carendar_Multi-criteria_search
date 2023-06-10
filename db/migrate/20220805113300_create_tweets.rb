class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :title
      t.text :body
      t.datetime :start_time

      t.timestamps
    end
  end
end
