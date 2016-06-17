require "ghee"
gh = Ghee.basic_auth("user", "pwd") #Githubのusernameとpassword
all_gists = gh.users("tetsu9taro25").gists
a_gist = all_gists[20]

a_gist.url
a_gist.description

a_gist.star


# gems/ghee-0.9.8/lib/ghee/resource_proxy.rb
class Ghee
  class ResourceProxy
    # ...

    def method_missing(message, *args, &block)
      subject.send(message, *args, &block)
    end

    def subject
      @subject ||= connection.get(path_prefix){|req| req.params.merge!params }.body
    end
  end
end


# gems/ghee-0.9.8/lib/ghee/gists.rb
class Ghee
  module API
    module Gists
      class Proxy < ::Ghee::ResourceProxy
        def star
          connection.put("#{path_prefix}/star").status == 204
        end

        # ...
      end
    end
  end
end

