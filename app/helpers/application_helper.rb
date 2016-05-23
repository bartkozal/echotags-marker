require 'digest/md5'

module ApplicationHelper
    def hexcolor(string)
      if string.present?
        "##{Digest::MD5.hexdigest(string)[0..5]}"
      else
        "#fff"
      end
    end
end
