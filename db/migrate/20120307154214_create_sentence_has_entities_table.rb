class CreateSentenceHasEntitiesTable < ActiveRecord::Migration
  def change
    create_table :sentence_has_entities, :id => false do |t|
      t.references :sentence, :null => false
      t.references :entity, :null => false
      t.references :ontology_version, :null => false
    end

    add_index :sentence_has_entities, [:sentence_id, :entity_id], :unique => true
    add_index :sentence_has_entities, [:entity_id, :sentence_id]

    change_table :sentence_has_entities do |t|
      t.foreign_key :entities, :dependent => :delete
      t.foreign_key :sentences, :dependent => :delete
    end
  end
end
