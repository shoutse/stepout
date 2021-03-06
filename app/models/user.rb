class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  #validates_presence_of :name,:birthday,:major,:occupation,:school,:former_occupation
  has_many :topics
  has_many :drafts
  has_many :comments

  has_many :likes,:dependent => :destroy
  has_many :like_topics,:through=>:likes,:source=>:topic
  has_many :subscriptions,:dependent => :destroy
  has_many :subscription_topics,:through=>:subscriptions,:source=>:topic

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>", sm: "50x50>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/


  def display_name
    name || email
  end    

  def self.from_omniauth(auth)
      # Case 1: Find existing user by facebook uid
      user = User.find_by_fb_uid( auth.uid )
      if user
         user.fb_token = auth.credentials.token
         #user.fb_raw_data = auth
         user.save!
        return user
      end

      # Case 2: Find existing user by email
      existing_user = User.find_by_email( auth.info.email )
      if existing_user
        existing_user.fb_uid = auth.uid
        existing_user.fb_token = auth.credentials.token
        #existing_user.fb_raw_data = auth
        existing_user.save!
        return existing_user
      end

      # Case 3: Create new password
      user = User.new
      user.fb_uid = auth.uid
      user.fb_token = auth.credentials.token
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      #user.fb_raw_data = auth
      user.save!
      return user
  end

  def admin?
    self.role == "admin"
  end

end
