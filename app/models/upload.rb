class Upload < ActiveRecord::Base
  has_attached_file :image,
  	:styles => {  }, # 画像サイズを指定
  :url  => "/arts/:basename.:extension", # 画像保存先のURL先
  :path => "#{Rails.root}/public/arts/:basename.:extension" # サーバ上の画像保存先パス
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
