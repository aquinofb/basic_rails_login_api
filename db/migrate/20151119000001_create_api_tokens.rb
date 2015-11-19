class CreateAPITokens < ActiveRecord::Migration
  def change
    create_table :api_tokens do |t|
      t.string :token
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
