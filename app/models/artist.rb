class Artist < ApplicationRecord
    has_many :tracks, dependent: :destroy
    # validates :name, {
    #     presence: true,
    #     length: {in:4..20},
    #     uniqueness: true,
    #     numericality: false
    # }
validate :name_length

    def name_length
        unless name.length >=3 && name.length<=20
            errors.add(:name, "Name must be at least 3 characters long")
        end
    end

    def name_domain
        unless name.match?(/moringaschool.com/)
            errors.add(:name, "Name must be a domain of moringaschool.com")
    end

end
