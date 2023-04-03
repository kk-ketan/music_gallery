class Music < ApplicationRecord

    has_many_attached :audios
    has_one_attached :cover

    validates :audioname, presence: true
    validates :description, presence: true

    belongs_to :user
     has_and_belongs_to_many :tags, dependent: :destroy


    def self.ransackable_attributes(auth_object = nil)
        ["audioname", "created_at", "description", "id", "published", "updated_at", "user_id"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["audios_attachments", "audios_blobs", "cover_attachment", "cover_blob", "tags", "user"]
      end

    def all_tags
       
        tags.map(&:alltags).join(", ")
      end
    
      def all_tags=(alltags)
        self.tags = alltags.split(",").map do |n|
          Tag.where(alltags: n.strip).first_or_create!
        end
    end



end




