class Starship
   def id
    self.url.split('/').last
   end
end