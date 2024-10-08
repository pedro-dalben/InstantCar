# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  scope :admins, -> { where(admin: true) }

  has_many :reservations, dependent: :destroy

  validates :full_name, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :birth_date, presence: true
end
