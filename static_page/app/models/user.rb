# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save { self.email = email.downcase }
  before_create :create_activation_digest
  # skip callback model khi nao
  validates :name, presence: true, length: { maximum: 54 }
  validates :email, presence: true, length: { maximum: 200 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_secure_password

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?

    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def active
    update_columns activated: true, activated_at: Time.zone.now
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_later
  end

  def send_reset_password_email
    UserMailer.password_reset(self).deliver_later
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_columns(reset_digest: User.digest(reset_token), reset_send_at: Time.zone.now)
    puts self.reset_token
  end

  def password_reset_expire? # => instance method
    reset_send_at < 2.hours.ago
  end

  def self.get_admin # => class method
    @user = User.where(admin: true)
  end
  # https://viblo.asia/p/phan-biet-class-method-va-instance-method-trong-ruby-gDVK2MLA5Lj

  # Dinh nghia scope trong model
  # Vi du ve class method, instance method
  # Tim hieu ve self va yield
  # Cac method trong active record (find, find_by, where, ...)
  # Phan biet cac loai bien ruby.
end
