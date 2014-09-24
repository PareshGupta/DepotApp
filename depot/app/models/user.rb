class User < ActiveRecord::Base
  validates :name, presence: true
  has_secure_password

  after_destroy :ensure_an_admin_remains
  
  around_save :around_save_method

  has_one :order, autosave: true
  
  # after_initialize do |user|
  #   puts 'you have initiated the user object'
  # end

  # after_find do |user|
  #   puts 'after_find called before after_initialize method'
  #   puts user.name
  # end

  # before_validation do |user|
  #   puts 'you have initiated the user object'
  #   puts user
  #   puts user.name
  # end

  before_save do
    puts 'before_save'
  end
  
  after_save do
    puts 'after_save'
  end

  def around_save_method
    # before_save_method
    puts 'around_save'
    yield
    # after_save_method
  end

  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can't delete last user"
      end
    end
end
