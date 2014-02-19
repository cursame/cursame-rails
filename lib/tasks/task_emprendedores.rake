# -*- coding: utf-8 -*-
task :courses_from_emprendedores => :environment do
	emv = [
		{:course => "ECATI 107", :profesores => ["cecati107.vinc@dgcft.sems.gob.mx","mina_lugo@hotmail.com","red29_11@hotmail.com","sector.vinculacion@dgcft.sems.gob.mx","evalua.vinculacion@dgcft.sems.gob.mx"]},
		{:course => "ICATMI MORELIA",:profesores => ["itzelcardm@hotmail.com","lorenatenorio111@hotmail.com","gandal_6_3@hotmail.com","sector.vinculacion@dgcft.sems.gob.mx","evalua.vinculacion@dgcft.sems.gob.mx"]},
		{:course => "ICATHI",:profesores => ["mluna@icathi.edu.mx","jessmontessdeoca@hotmail.com","marflores32@hotmail.com","sector.vinculacion@dgcft.sems.gob.mx","evalua.vinculacion@dgcft.sems.gob.mx"]},
		{:course => "CECATI No. 128 RICARDO FLORES MAGÓN", :profesores => ["cecati128c@yahoo.com.mx","ratrejob@hotmail.com,maxe012@hotmail.com","sector.vinculacion@dgcft.sems.gob.mx","evalua.vinculacion@dgcft.sems.gob.mx"]},
		{:course => "CECATI No. 176", :profesores => ["cecati176.cap@dgcft.sems.gob.mx","jessikcrz@gmail.com","fcaunamrem@hotmail.com","sector.vinculacion@dgcft.sems.gob.mx","evalua.vinculacion@dgcft.sems.gob.mx"]},
		{:course => "ICAT No. 2 CALKINI",:profesores => ["carmenlgg@hotmail.com","ep530513@hotmail.com.com","jafet112@hotmail.com","sector.vinculacion@dgcft.sems.gob.mx","evalua.vinculacion@dgcft.sems.gob.mx"]},
		{:course => "ICATSIN CULIACAN I", :profesores => ["elirente@hotmail.com","promocapacitacion@icatsin.edu.mx","el_maple_69@hotmail.com","sector.vinculacion@dgcft.sems.gob.mx","evalua.vinculacion@dgcft.sems.gob.mx"]},
		{:course => "CENTRO DE CAPACITACION PARA EL TRABAJO INDUSTRIAL NUM 170", :profesores => ["juansolisc@hotmail.com","julyfuentes1@hotmail.com","sector.vinculacion@dgcft.sems.gob.mx","evalua.vinculacion@dgcft.sems.gob.mx"]},
		{:course => "CECATI 32", :profesores => ["noraeruizg@hotmail.com","emprendedorescecati32@gmail.com","emprendedorescecati32@gmail.com","sector.vinculacion@dgcft.sems.gob.mx","evalua.vinculacion@dgcft.sems.gob.mx"]},
		{:course => "CBTA No. 72 Miguel Hidalgo Y Costilla",:profesores => ["jaimeluquin@hotmail.com","juan_mgc14@hotmail.com","rrio164@gmail.com","paniaguagranadosjorgr@yahoo.com.mx"]},
		{:course => "CBTA No. 20 Gral. Pánfilo Natera García", :profesores => ["xequirinop@yahoo.com.mx","salvadorrm2009@hotmail.com","go.1984@hotmail.com","paniaguagranadosjorgr@yahoo.com.mx"]},
		{:course => "CBTA N° 31 Hilarion Romero Gil",:profesores => ["adrr64@hotmail.com","macegusa@hotmail.com","jesapoly_22@hotmail.com","paniaguagranadosjorgr@yahoo.com.mx"]},
		{:course => "CBTA No. 13 Gral. Emiliano Zapata",:profesores => ["neker_13@hotmail.com","ceciliasosaavila@hotmail.com","cheliya_ck@hotmail.com","paniaguagranadosjorgr@yahoo.com.mx"]},
		{:course => "CBTA No. 34, Gral. Emiliano Zapata Salazar",:profesores => ["biol221@hotmail.com","jrbmazata@yahoo.com.mx","wallacemv@hotmail.com","paniaguagranadosjorgr@yahoo.com.mx"]},
		{:course => "CBTA No. 96  Dr. Valentin Gomez Farías",:profesores => ["tetrax02@hotmail.com","chewis63@hotmail.com","gaby19_06@hotmail.com","paniaguagranadosjorgr@yahoo.com.mx"]},
		{:course => "CBTA N° 35 Leona Vicario",:profesores => ["marcelacbta35@hotmail.com","kitzu_savi@hotmail.com","ils_1101@hotmail.com","paniaguagranadosjorgr@yahoo.com.mx"]},
		{:course => "CBTA N° 67 Ramón G. Bonfil",:profesores => ["fratelo31@hotmail.com","paniaguagranadosjorgr@yahoo.com.mx"]},
		{:course => "CBTA No. 181 Gral. José María Morelos y Pavón",:profesores => ["paniaguagranadosjorgr@yahoo.com.mx"]},
		{:course => "CBTA No.91 Dr. Manuel Velazco Suarez",:profesores => ["jgomezutrilla@yahoo.com.mx","abenaruiz@hotmail.com","guijo2612@hotmail.com","paniaguagranadosjorgr@yahoo.com.mx"]},
		{:course => "CBTA  No.21 Prof. Federico Berrueto Ramón",:profesores => ["jparracbta21@hotmail.com","aldo_modragon@yahoo.com","paniaguagranadosjorgr@yahoo.com.mx"]},
		{:course => "CETMAR 02 CAMPECHE" ,:profesores => ["planeación_cetamr02@yahoo.com.mx","novelo72@hotmail.com","karmaro2@yahoo.com.mx","guillermo.valades@dgecytm.sems.gob.mx"]},
		{:course => "CETMAR 03 GUAYMAS",:profesores => ["terejrc@hotmail.com","mayamarquez@hotmail.com","jyronaval_06@hotmail.com","guillermo.valades@dgecytm.sems.gob.mx"]},
		{:course => "CETMAR 06 LA CRUZ DE HUANACXTLE",:profesores => ["ancawa26@hotmail.com","daro-1@hotmail.com","caesar_23@hotmail.com","guillermo.valades@dgecytm.sems.gob.mx"]},
		{:course => "CETMAR 07 VERACRUZ",:profesores => ["mirandajorge21@hotmail.com","pamelaver_58@hotmail.com","rodgezestevez_d@hotmail.com","guillermo.valades@dgecytm.sems.gob.mx"]},
		{:course => "CETMAR 08 MAZATLAN",:profesores => ["norbertafausto@hotmail.com","norbertafausto@gmail.com","manuellino_alvarez@hotmail.com","guillermo.valades@dgecytm.sems.gob.mx"]},
		{:course => "CETMAR 12 MANZANILLO",:profesores => ["gabrielparralua@gmail.com","araceli1507@hotmail.com","guillermo.valades@dgecytm.sems.gob.mx"]},
		{:course => "CETMAR  11 ENSENADA",:profesores => ["cetvinculacion@gmail.com","eduardogauna@hotmail.com","dalera11@hotmail.com","guillermo.valades@dgecytm.sems.gob.mx"]},
		{:course => "CETMAR  18 ACAPULCO DE JUÁREZ",:profesores => ["maryvillanueva67@hotmail.com","rgaribo82@hotmail.com","mariluzrimi@hotmail.com","guillermo.valades@dgecytm.sems.gob.mx"]},
		{:course => "CETMAR19  FRONTERA",:profesores => ["santosrosa65@hotmail.com","ligonio65@hotmail.com","tina_narvaez@hotmail.com","guillermo.valades@dgecytm.sems.gob.mx"]},
		{:course => "CETMAR 20 TUXPAN",:profesores => ["klaudiasalinas@hotmail.com","rcaceres2003@hotmail.com","biolnluis@hotmail.com","guillermo.valades@dgecytm.sems.gob.mx"]},
		{:course => "CETAC 02 TEZONTEPEC",:profesores => ["juanfel100@hotmail.com","rafhgo@hotmail.com","caroyu@hotmail.com","guillermo.valades@dgecytm.sems.gob.mx"]},
		{:course => "CETAC 01 JOCOTEPEC",:profesores => ["rigocetac@hotmail.com","elsaibalo@hotmail.com","elsaibalo@hotmail.com","guillermo.valades@dgecytm.sems.gob.mx"]}
	]
    @network = Network.find_by_subdomain('emprendedores')
    if @network != nil
    	puts "Comienza el creado de cursos"
	emv.each do |env|
		puts "se crea el curso: #{env[:course]}"
        
        @finish = Time.now + 120.days 

        @course = Course.create(:title => "#{env[:course]}", :silabus => "Información", :init_date => Time.now , :finish_date=> @finish, :survey_param_evaluation => 70, :delivery_param_evaluation => 30, :network_id => @network.id, :public_status => "Private")
        
        puts @course

        env[:profesores].each do |p|
           puts p
           @user = User.find_by_email(p)
	           if @user == nil
	           	puts "El usuario no ha sido encontrado no puede ser agregado al curso"
	           else
	           	puts "el usuario #{@user} ha sido encontrado procederemos a gestionar su ingreso al curso"
                 @member = MembersInCourse.create(:user_id => @user.id, :course_id => @course.id, :accepted => true, :owner => true, :title => @course.title, :network_id => @network.id, :active_status => true)
	           end

        end
	end
    end
end