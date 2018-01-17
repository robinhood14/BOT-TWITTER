 # ligne très importante qui appelle la gem. Sans elle, le programme ne saura pas appeler Twitter
require 'twitter'
require 'pry'

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "XXXXX"
  config.consumer_secret     = "XXXXX"
  config.access_token        = "XXXXX"
  config.access_token_secret = "XXXXX"
end


client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "XXXXX"
  config.consumer_secret     = "XXXXX"
  config.access_token        = "XXXXX"
  config.access_token_secret = "XXXXX"
end


# Création d'un bot qui like tous les tweets faits par une certaine liste de journalistes, dès qu'ils sortent. (like les tweets récents (20 derniers) grace a la méthode tweet_id )

#Creer une liste avec les identifiant des utilisateurs.
list_journalist = ["@jeanmidata1","@Seb_Pommier","@Alex_Bensaid","@GuillaumeGaven","@annelaurechouin","@Oliviader","@guerricp","@JMMarchaut","@cyceron","@gregory_raymond","@vhunsinger","@l_peillon"]
list_journalist.each do |x|  #on itere avec la méthode each do |x| pour appliquer la méthode suivante sur chaque donnnées.     
	tweet_id = client.user_timeline(x) #Fetch on définit une variable qui comprend les tweet les plus recent des users de la liste avec la méthode client.user_timeline(x) 
    	puts (tweet_id) #Affiche les IDs des tweets
    client.favorite(tweet_id) #on applique la methode client.favorite qui Like la liste des tweets
end

 
