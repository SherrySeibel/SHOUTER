require "digest/md5"

module ShoutsHelper
  def gravatar user, size = 60
    digest = Digest::MD5.hexdigest(user.email).downcase
    image_tag("http://gravatar.com/avatar/#{digest}?s=#{size}&r=pg&d=http://i36.photobucket.com/albums/e17/cordiallysherry/shout_gravatar_zps0d578c1f.png")
  end

  def shouterize text
    link_hashtags(strip_tags(text)).html_safe
  end

  private

  def link_hashtags text
    text.gsub(/#\w+/) { |match| link_to(match, hashtag_path(match[1..-1])) }
  end
end
