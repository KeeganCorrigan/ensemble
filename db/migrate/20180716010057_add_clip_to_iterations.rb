class AddClipToIterations < ActiveRecord::Migration[5.1]
  def change
    def self.up
      add_attachment :iterations, :clip
    end

    def self.down
      remove_attachment :iterations, :clip
    end
  end
end
