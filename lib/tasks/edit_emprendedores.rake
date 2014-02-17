# -*- coding: utf-8 -*-
task :edit_red_emprendedores => :environment do
   users =[
			{:email => "cecati107.vinc@dgcft.sems.gob.mx", :password => "emprendedores110"},
			{:email => "itzelcardm@hotmail.com", :password => "emprendedores111"},
			{:email => "mluna@icathi.edu.mx", :password => "emprendedores112"},
			{:email => "cecati128c@yahoo.com.mx", :password => "emprendedores113"},
			{:email => "cecati176.cap@dgcft.sems.gob.mx", :password => "emprendedores114"},
			{:email => "carmenlgg@hotmail.com", :password => "emprendedores115"},
			{:email => "elirente@hotmail.com", :password => "emprendedores116"},
			{:email => "juansolisc@hotmail.com", :password => "emprendedores117"},
			{:email => "noraeruizg@hotmail.com", :password => "emprendedores118"},
			{:email => "mina_lugo@hotmail.com", :password => "emprendedores119"},
			{:email => "lorenatenorio111@hotmail.com", :password => "emprendedores120"},
			{:email => "jessmontessdeoca@hotmail.com", :password => "emprendedores121"},
			{:email => "ratrejob@hotmail.com", :password => "emprendedores122"},
			{:email => "jessikcrz@gmail.com", :password => "emprendedores123"},
			{:email => "ep530513@hotmail.com", :password => "emprendedores124"},
			{:email => "promocapacitacion@icatsin.edu.mx", :password => "emprendedores125"},
			{:email => "julyfuentes1@hotmail.com", :password => "emprendedores126"},
			{:email => "emprendedorescecati32@gmail.com", :password => "emprendedores127"},
			{:email => "red29_11@hotmail.com", :password => "emprendedores128"},
			{:email => "gandal_6_3@hotmail.com", :password => "emprendedores129"},
			{:email => "marflores32@hotmail.com", :password => "emprendedores130"},
			{:email => "fcaunamrem@hotmail.com", :password => "emprendedores131"},
			{:email => "jafet112@hotmail.com", :password => "emprendedores132"},
			{:email => "el_maple_69@hotmail.com", :password => "emprendedores133"},
			{:email => "emprendedorescecati32@gmail.com", :password => "emprendedores134"},
			{:email => "sector.vinculacion@dgcft.sems.gob.mx", :password => "emprendedores135"},
			{:email => "evalua.vinculacion@dgcft.sems.gob.mx", :password => "emprendedores136"},
			{:email => "jaimeluquin@hotmail.com", :password => "emprendedores137"},
			{:email => "xequirinop@yahoo.com.mx", :password => "emprendedores138"},
			{:email => "adrr64@hotmail.com", :password => "emprendedores139"},
			{:email => "neker_13@hotmail.com", :password => "emprendedores140"},
			{:email => "chewis63@hotmail.com", :password => "emprendedores141"},
			{:email => "kitzu_savi@hotmail.com", :password => "emprendedores142"},
			{:email => "abenaruiz@hotmail.com", :password => "emprendedores143"},
			{:email => "aldo_modragon@yahoo.com", :password => "emprendedores144"},
			{:email => "rrio164@gmail.com", :password => "emprendedores145"},
			{:email => "go.1984@hotmail.com", :password => "emprendedores146"},
			{:email => "jesapoly_22@hotmail.com", :password => "emprendedores147"},
			{:email => "cheliya_ck@hotmail.com", :password => "emprendedores148"},
			{:email => "wallacemv@hotmail.com", :password => "emprendedores149"},
			{:email => "gaby19_06@hotmail.com", :password => "emprendedores150"},
			{:email => "ils_1101@hotmail.com", :password => "emprendedores151"},
			{:email => "paniaguagranadosjorgr@yahoo.com.mx", :password => "emprendedores152"},
			{:email => "jorgeluis.lavin@bachilleres.edu.mx", :password => "emprendedores153"},
			{:email => "jaime@impulsa.org.mx", :password => "emprendedores154"},
			{:email => "mariajuana@impulsa.org.mx", :password => "emprendedores155"},
			{:email => "alaborde@ashoka.org", :password => "emprendedores156"},
			{:email => "irodriguez@ashoka.org", :password => "emprendedores157"},
			{:email => "hfernandez@angelventuresmexico.com", :password => "emprendedores158"},
			{:email => "chuertas@angelventuresmexico.com", :password => "emprendedores159"},
			{:email => "rivasraquel0@gmail.com", :password => "emprendedores160"},
			{:email => "davidmontielalvino@yahoo.com.mx", :password => "emprendedores161"},
			{:email => "arturo_gomezsilva@yahoo.com.mx", :password => "emprendedores162"},
			{:email => "azpog@yahoo.com.mx", :password => "emprendedores163"},
			{:email => "planeaciÑn_cetamr02@yahoo.com.mx", :password => "emprendedores164"},
			{:email => "novelo72@hotmail.com", :password => "emprendedores165"},
			{:email => "terejrc@hotmail.com", :password => "emprendedores166"},
			{:email => "karmaro2@yahoo.com.mx", :password => "emprendedores167"},
			{:email => "mayamarquez@hotmail.com", :password => "emprendedores168"},
			{:email => "jyronaval_06@hotmail.com", :password => "emprendedores169"},
			{:email => "ancawa26@hotmail.com", :password => "emprendedores170"},
			{:email => "daro-1@hotmail.com", :password => "emprendedores171"},
			{:email => "caesar_23@hotmail.com", :password => "emprendedores172"},
			{:email => "mirandajorge21@hotmail.com", :password => "emprendedores173"},
			{:email => "pamelaver_58@hotmail.com", :password => "emprendedores174"},
			{:email => "rodgezestevez_d@hotmail.com", :password => "emprendedores175"},
			{:email => "norbertafausto@hotmail.com", :password => "emprendedores176"},
			{:email => "norbertafausto@gmail.com", :password => "emprendedores177"},
			{:email => "manuellino_alvarez@hotmail.com", :password => "emprendedores178"},
			{:email => "gabrielparralua@gmail.com", :password => "emprendedores179"},
			{:email => "araceli1507@hotmail.com", :password => "emprendedores180"},
			{:email => "cetvinculacion@gmail.com", :password => "emprendedores181"},
			{:email => "eduardogauna@hotmail.com", :password => "emprendedores182"},
			{:email => "dalera11@hotmail.com", :password => "emprendedores183"},
			{:email => "maryvillanueva67@hotmail.com", :password => "emprendedores184"},
			{:email => "rgaribo82@hotmail.com", :password => "emprendedores185"},
			{:email => "mariluzrimi@hotmail.com", :password => "emprendedores186"},
			{:email => "santosrosa65@hotmail.com", :password => "emprendedores187"},
			{:email => "ligonio65@hotmail.com", :password => "emprendedores188"},
			{:email => "tina_narvaez@hotmail.com", :password => "emprendedores189"},
			{:email => "klaudiasalinas@hotmail.com", :password => "emprendedores190"},
			{:email => "rcaceres2003@hotmail.com", :password => "emprendedores191"},
			{:email => "biolnluis@hotmail.com", :password => "emprendedores192"},
			{:email => "juanfel100@hotmail.com", :password => "emprendedores193"},
			{:email => "rafhgo@hotmail.com", :password => "emprendedores194"},
			{:email => "caroyu@hotmail.com", :password => "emprendedores195"},
			{:email => "rigocetac@hotmail.com", :password => "emprendedores196"},
			{:email => "elsaibalo@hotmail.com", :password => "emprendedores197"},
			{:email => "eccfilos@gmail.com", :password => "emprendedores198"},
			{:email => "katiajanette@hotmail.com", :password => "emprendedores199"}

   ]

   users.each do |u|
   		user = User.find_by_email(u[:email])
   		if user.nil?
   			
   			puts "usuario nulo"
   			puts "#{u.email}"

   		else
   	    	puts "#{user.name}"
   			puts "#{user.email}"
   			user.password = u[:password]
   			user.confirmed_at = "#{Time.now}"
   			user.save
   			puts "#{user.confirmed_at}"
   			@mail = Notifier.user_mailer_with_password(user,u[:password]).deliver
   		end
   		
   end
end
