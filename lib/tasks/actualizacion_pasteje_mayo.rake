task :actualizar_pasteje => :environment do

    network_id = 6

    #damos de al ra a Felix Arturo
    mageo = { :first_name => 'Felix Arturo', :last_name => 'Orta Recendiz', :email => 'farturo.orta@gmail.com', :password => 'ytWrwi9t4A' }
    user = User.create :first_name => mageo[:first_name], :last_name => mageo[:last_name], :email => mageo[:email], :password => mageo[:password], :personal_url => "#{mageo[:first_name]}#{mageo[:last_name]}".split.join
    Permissioning.create :user_id => user.id, :role_id => '1', :network_id => network_id

    #todos a ingles
    alumnos1a = [         
        { :first_name => 'ALINE ', :last_name => 'ALMAZAN SALAZAR', :email => 'info+011a@cursa.me',:password => '59nKukOImS', :group => 'Primero A' },
        { :first_name => 'NANCY ', :last_name => 'CARREOLA SANCHEZ',:email => 'info+021a@cursa.me' ,:password => 'SQOGcTnc7a', :group => 'Primero A' },
        { :first_name => 'JAN SAMUEL', :last_name => 'DE LA CRUZ PALOMARES',:email => 'info+031a@cursa.me' ,:password => 'Tq0W5GBMOP', :group => 'Primero A' },
        { :first_name => 'ANDREA LIZBETH', :last_name => 'DOROTEO DE JESUS',:email => 'info+041a@cursa.me' ,:password => 'qc0jWAVnTg', :group => 'Primero A' },
        { :first_name => 'JEREMY ', :last_name => 'FAUSTINO SANDOVAL',:email => 'info+051a@cursa.me' ,:password => 'Qbl7NHMd4P', :group => 'Primero A' },
        { :first_name => 'CHRISTIAN ', :last_name => 'GARCIA ANTONIO',:email => 'info+061a@cursa.me' ,:password => 'PUKNesZG3S', :group => 'Primero A' },
        { :first_name => 'CLAUDIA ', :last_name => 'GONZALEZ SANCHEZ',:email => 'info+071a@cursa.me' ,:password => 'L9FBO6xUgl', :group => 'Primero A' },
        { :first_name => 'FERNANDO ', :last_name => 'LARA LEON',:email => 'info+081a@cursa.me' ,:password => 'iVTFSXb5Lf', :group => 'Primero A' },
        { :first_name => 'YAZMIN ', :last_name => 'LOPEZ GONZALEZ',:email => 'info+091a@cursa.me' ,:password => 'xFKpx1Aqn4', :group => 'Primero A' },
        { :first_name => 'ERIKA LIZBETH', :last_name => 'LOPEZ TORIBIO',:email => 'info+101a@cursa.me' ,:password => 'weq8hu9Lat', :group => 'Primero A' },
        { :first_name => 'ANGEL ', :last_name => 'MALDONADO GARCIA',:email => 'info+111a@cursa.me' ,:password => 's3j8IvJPqk', :group => 'Primero A' },
        { :first_name => 'BELEN ', :last_name => 'MARTINEZ PLATA',:email => 'info+121a@cursa.me' ,:password => '8WXn4Oix1R', :group => 'Primero A' },
        { :first_name => 'MONSERRAT ', :last_name => 'MENDOZA LEANDRO',:email => 'info+131a@cursa.me' ,:password => 'jiHh6OtmHz', :group => 'Primero A' },
        { :first_name => 'MARIA FERANANDA', :last_name => 'MOLINA ALANUZA',:email => 'info+141a@cursa.me' ,:password => 'OF9dCPc9RM', :group => 'Primero A' },
        { :first_name => 'MOESHA ELISAMA', :last_name => 'NAVA BOJORQUEZ',:email => 'info+151a@cursa.me' ,:password => '2BbEaA9F37', :group => 'Primero A' },
        { :first_name => 'MONTSERRAT ', :last_name => 'REYES DIAZ',:email => 'info+161a@cursa.me' ,:password => 'QamezbO4LH', :group => 'Primero A' },
        { :first_name => 'ITZEL ', :last_name => 'ROMERO BECERRIL',:email => 'info+171a@cursa.me' ,:password => '7FBYQVuo7N', :group => 'Primero A' },
        { :first_name => 'XIMENA ', :last_name => 'SERVIN SANCHEZ',:email => 'info+181a@cursa.me' ,:password => 'slmb6rV6Jk', :group => 'Primero A' },
        { :first_name => 'JOSE ANGEL ', :last_name => 'VILCHIS GONZALEZ',:email => 'info+191a@cursa.me' ,:password => 's8mb8rV8Jk', :group => 'Primero A' }
    ]
    alumnos1b = [      
        { :first_name => 'DAFNE STACEY', :last_name => 'AVENDANO FELIPE', :email => 'info+011b@cursa.me',:password => 'bnoEsSJ2Fe', :group => 'Primero B' },
        { :first_name => 'NEYDY LIZBETH', :last_name => 'BECERRIL LARA', :email => 'info+021b@cursa.me',:password => 'XLEk8928z4', :group => 'Primero B' },
        { :first_name => 'LUIS ARMANDO', :last_name => 'BERNAL CUEVAS', :email => 'info+031b@cursa.me',:password => '1mNN88wf40', :group => 'Primero B' },
        { :first_name => 'JHOANA ', :last_name => 'CLEMENTE LEOCADIO', :email => 'info+041b@cursa.me',:password => 'ObamXU9Ktr', :group => 'Primero B' },
        { :first_name => 'AARON ', :last_name => 'CRUZ GONZALEZ', :email => 'info+051b@cursa.me',:password => '0auOg1VAlj', :group => 'Primero B' },
        { :first_name => 'JUAN ANGEL', :last_name => 'DOMINGUEZ MIRANDA', :email => 'info+061b@cursa.me',:password => 'b54Kdn3iXE', :group => 'Primero B' },
        { :first_name => 'DULCE NATALIA', :last_name => 'ENRIQUEZ MACARIO', :email => 'info+071b@cursa.me',:password => 'SMEL9PlS7Y', :group => 'Primero B' },
        { :first_name => 'FABIOLA ', :last_name => 'GARDUNO LOPEZ', :email => 'info+081b@cursa.me',:password => 'UH5z7WztKh', :group => 'Primero B' },
        { :first_name => 'EDSON MAURICIO', :last_name => 'GARDUNO SEGUNDO', :email => 'info+091b@cursa.me',:password => 'WxxZCZ4fPR', :group => 'Primero B' },
        { :first_name => 'JORGE ', :last_name => 'GONZALEZ MARTINEZ', :email => 'info+101b@cursa.me',:password => 'hq40Dw2v2k', :group => 'Primero B' },
        { :first_name => 'ALONDRA ', :last_name => 'JASSO MIRANDA', :email => 'info+111b@cursa.me',:password => 'IoU0dt56BW', :group => 'Primero B' },
        { :first_name => 'MARLEN ', :last_name => 'MALDONADO MENDEZ', :email => 'info+121b@cursa.me',:password => 'x1KQajhV26', :group => 'Primero B' },
        { :first_name => 'MEZTLI DANIELA', :last_name => 'MARTINEZ ARRIAGA', :email => 'info+131b@cursa.me',:password => 'vL4XfKeY5g', :group => 'Primero B' },
        { :first_name => 'OSCAR ', :last_name => 'MARTINEZ GONZALEZ', :email => 'info+141b@cursa.me',:password => 'KX9tMm6oZu', :group => 'Primero B' },
        { :first_name => 'ALONDRA JANETH', :last_name => 'OCADIZ ALANUZA', :email => 'info+151b@cursa.me',:password => 'IyIGaVTcL8', :group => 'Primero B' },
        { :first_name => 'YESSICA ', :last_name => 'RAMIREZ GARCIA', :email => 'info+161b@cursa.me',:password => 'NScsY5i5mO', :group => 'Primero B' },
        { :first_name => 'ELIZABETH ', :last_name => 'REYES ANTONIO', :email => 'info+171b@cursa.me',:password => 'C0tHbiFl9S', :group => 'Primero B' },
        { :first_name => 'DULCE JAZMIN', :last_name => 'SALINAS LOPEZ', :email => 'info+181b@cursa.me',:password => 'UE2Ln4yNzC', :group => 'Primero B' },
        { :first_name => 'CRISTIAN ', :last_name => 'SEGUNDO SILVERIO', :email => 'info+191b@cursa.me',:password => 'XWbOWAZ0Wf', :group => 'Primero B' },
        { :first_name => 'MARISOL ', :last_name => 'VAZQUEZ DOMINGUEZ', :email => 'info+201b@cursa.me',:password => 'H71edcKNAg', :group => 'Primero B' }
    ]

    alumnos2a = [      
        { :first_name => 'BRANDON ', :last_name => 'ANTONIO CIRILO', :email => 'info+012a@cursa.me',:password => 'QVS4q0ZQwj', :group => 'Segundo A' },
        { :first_name => 'MARIA DE LOS ANGELES', :last_name => 'BARRIOS JASSO', :email => 'info+022a@cursa.me',:password => 'csEcLJ1jr2', :group => 'Segundo A' },
        { :first_name => 'MARIA FERNANDA', :last_name => 'CADENA FLORES', :email => 'info+032a@cursa.me',:password => 'zQROo1DZHA', :group => 'Segundo A' },
        { :first_name => 'MONCERATH ', :last_name => 'DE JESUS LAZARO', :email => 'info+042a@cursa.me',:password => 'cbGc0PyEWH', :group => 'Segundo A' },
        { :first_name => 'BRENDA JAQUELINE', :last_name => 'DE JESUS LOPEZ', :email => 'info+052a@cursa.me',:password => 'oH1d68SsXw', :group => 'Segundo A' },
        { :first_name => 'JOSE DE JESUS ', :last_name => 'ENRIQUEZ BARRIOS', :email => 'info+062a@cursa.me',:password => 'fnE1LJARMU', :group => 'Segundo A' },
        { :first_name => 'REBECA ', :last_name => 'GENARO APOLINAR', :email => 'info+072a@cursa.me',:password => 'RLSvR7Z59C', :group => 'Segundo A' },
        { :first_name => 'YARET ', :last_name => 'GONZALEZ RIVERA', :email => 'info+082a@cursa.me',:password => 'BZX78lwwKO', :group => 'Segundo A' },
        { :first_name => 'MARIA FERNANDA', :last_name => 'GUZMAN BLAS', :email => 'info+092a@cursa.me',:password => 'u1KX0c6ngq', :group => 'Segundo A' },
        { :first_name => 'JASMIN ', :last_name => 'HUERTA LARA', :email => 'info+102a@cursa.me',:password => 'mq8C9XlMJy', :group => 'Segundo A' },
        { :first_name => 'FELIPE JESUS', :last_name => 'JERONIMO FLORES', :email => 'info+112a@cursa.me',:password => 'svoFQ9fvMo', :group => 'Segundo A' },
        { :first_name => 'XEARI MILTHON', :last_name => 'LAZARO GONZALEZ', :email => 'info+122a@cursa.me',:password => '4FIDecMhGC', :group => 'Segundo A' },
        { :first_name => 'MIREYA ', :last_name => 'LOPEZ GONZALEZ', :email => 'info+132a@cursa.me',:password => '2Q7hudzNBQ', :group => 'Segundo A' },
        { :first_name => 'LESLIE ', :last_name => 'LUCIANO CIRILO', :email => 'info+142a@cursa.me',:password => 'Ofq1zrc31m', :group => 'Segundo A' },
        { :first_name => 'ARELI ', :last_name => 'MARTINEZ HERNANDEZ', :email => 'info+152a@cursa.me',:password => 'Qysa8mbhro', :group => 'Segundo A' },
        { :first_name => 'PAOLA ', :last_name => 'MARINEZ ONOFRE', :email => 'info+162a@cursa.me',:password => '0YgNxZ4KzK', :group => 'Segundo A' },
        { :first_name => 'SAMUEL ', :last_name => 'RAMIREZ DOMINGUEZ', :email => 'info+172a@cursa.me',:password => '9pdV4UHM00', :group => 'Segundo A' },
        { :first_name => 'SHARON ', :last_name => 'RAMIREZ MENDOZA', :email => 'info+182a@cursa.me',:password => 'bne3g2iIhp', :group => 'Segundo A' },
        { :first_name => 'ERICA ', :last_name => 'VICTORIANO PATRICIO', :email => 'info+192a@cursa.me',:password => 'mkrz7B9AcT', :group => 'Segundo A' }
    ]

    alumnos2b = [      
        { :first_name => 'MARIA DE LA LUZ', :last_name => 'ALBERTO SERRANO',:email => 'info+012b@cursa.me', :password => 'PRgM0xgKa1', :group => 'Segundo B' },
        { :first_name => 'JAQUELINE ', :last_name => 'BARRIOS DOMINGUEZ',:email => 'info+022b@cursa.me', :password => 'WOi8VpvmVX', :group => 'Segundo B' },
        { :first_name => 'ANA CRISTAL', :last_name => 'CRUZ MENDOZA',:email => 'info+032b@cursa.me', :password => 'Zgr2qow6sR', :group => 'Segundo B' },
        { :first_name => 'MARIA FERNANDA', :last_name => 'ENRIQUEZ SANTANA',:email => 'info+042b@cursa.me', :password => 'jH8xen3j9K', :group => 'Segundo B' },
        { :first_name => 'JOSE DE JESUS ', :last_name => 'FELIPE MORENO',:email => 'info+052b@cursa.me', :password => '7kPJ9qxuxo', :group => 'Segundo B' },
        { :first_name => 'NEREIDA ', :last_name => 'FRANCISCO SOTELO',:email => 'info+062b@cursa.me', :password => 'TVe9RAuF91', :group => 'Segundo B' },
        { :first_name => 'DANIELA ', :last_name => 'GARCIA ANTONIO',:email => 'info+072b@cursa.me', :password => 'Pm7VBlPFrq', :group => 'Segundo B' },
        { :first_name => 'BRENDA ', :last_name => 'GARCIA HERNANDEZ',:email => 'info+082b@cursa.me', :password => 'tfaRl9xOxz', :group => 'Segundo B' },
        { :first_name => 'ANGEL GAEL', :last_name => 'GENARO REYES',:email => 'info+092b@cursa.me', :password => 'mEsQk29dDy', :group => 'Segundo B' },
        { :first_name => 'MARIA CARLOTA', :last_name => 'GONZALEZ LORENZO',:email => 'info+102b@cursa.me', :password => '7ovLVxBv1Z', :group => 'Segundo B' },
        { :first_name => 'ANAQUETZALINI ', :last_name => 'GUADALUPE VAZQUEZ',:email => 'info+112b@cursa.me', :password => 'QJYAuP2lgP', :group => 'Segundo B' },
        { :first_name => 'PATSY ROSARIO', :last_name => 'LEON GIL',:email => 'info+122b@cursa.me', :password => 'jCd3vxwcu6', :group => 'Segundo B' },
        { :first_name => 'JOANA USURIZ', :last_name => 'LOPEZ FLORES',:email => 'info+132b@cursa.me', :password => '9jREZiBXQz', :group => 'Segundo B' },
        { :first_name => 'AARON ', :last_name => 'LORENZO DOROTEO',:email => 'info+142b@cursa.me', :password => 'tlsX0DhVOI', :group => 'Segundo B' },
        { :first_name => 'EDUARDO ', :last_name => 'MONROY JIMENEZ',:email => 'info+152b@cursa.me', :password => 'LJveetf0pm', :group => 'Segundo B' },
        { :first_name => 'ANDREA ', :last_name => 'MONTENEGRO PEREZ',:email => 'info+162b@cursa.me', :password => 'Vobad6jBai', :group => 'Segundo B' },
        { :first_name => 'ADELA ', :last_name => 'NAVA MARTINEZ',:email => 'info+172b@cursa.me', :password => 'JBkfkTN4yA', :group => 'Segundo B' },
        { :first_name => 'JAQUELINE ', :last_name => 'ORTEGA VAZQUEZ',:email => 'info+182b@cursa.me', :password => 'h1RMy9Gy6m', :group => 'Segundo B' },
        { :first_name => 'BRYANT ', :last_name => 'RAMIREZ VELAZQUEZ',:email => 'info+192b@cursa.me', :password => 'Hb9luD0mRH', :group => 'Segundo B' },
        { :first_name => 'HEIDY ', :last_name => 'SALINAS MARTINEZ',:email => 'info+202b@cursa.me', :password => 'qEkY5tbnHn', :group => 'Segundo B' },
        { :first_name => 'ANDREA BRYTANI', :last_name => 'VELASCO MORALES',:email => 'info+212b@cursa.me', :password => 'a6pUKQELC4', :group => 'Segundo B' }
    ]

    alumnos3a = [     
        { :first_name => 'ANDREA ', :last_name => 'ALCANTARA MILLARES', :email => 'info+013a@cursa.me',:password => '0tcpFL6AfH', :group => 'Tercero A' },
        { :first_name => 'JUAN MANUEL', :last_name => 'ALCANTARA MILLARES', :email => 'info+023a@cursa.me',:password => 'uKXAdg3ZXM', :group => 'Tercero A' },
        { :first_name => 'GUILLERMO ENRIQUE', :last_name => 'CARMONA BECERRIL', :email => 'info+033a@cursa.me',:password => 'soeKwOe1Zy', :group => 'Tercero A' },
        { :first_name => 'ABRIL ', :last_name => 'CIRILO GARCIA', :email => 'info+043a@cursa.me',:password => '6KmIYIArAO', :group => 'Tercero A' },
        { :first_name => 'YAHAIRA HAYDEE', :last_name => 'CONTRERAS ORTIZ', :email => 'info+053a@cursa.me',:password => '1Y05tkG9UC', :group => 'Tercero A' },
        { :first_name => 'ALONDRA ', :last_name => 'DIEGO GARDUNO', :email => 'info+063a@cursa.me',:password => 'a8KMqRz7k4', :group => 'Tercero A' },
        { :first_name => 'SERGIO ', :last_name => 'DOMINGUEZ SANCHEZ', :email => 'info+073a@cursa.me',:password => 'eSMcZ83jyz', :group => 'Tercero A' },
        { :first_name => 'ANDRES ', :last_name => 'EPIGMENIO GARCIA', :email => 'info+083a@cursa.me',:password => 'mhF95jLPwZ', :group => 'Tercero A' },
        { :first_name => 'YOANA ', :last_name => 'FAUSTINO HERNANDEZ', :email => 'info+093a@cursa.me',:password => 'G7L52ZQUeO', :group => 'Tercero A' },
        { :first_name => 'CESAR ', :last_name => 'FLORES REYES', :email => 'info+103a@cursa.me',:password => 'XFPkjBtYL5', :group => 'Tercero A' },
        { :first_name => 'NORMA LAURA', :last_name => 'GARCIA CONTRERAS', :email => 'info+113a@cursa.me',:password => 'ssh6jkcbpP', :group => 'Tercero A' },
        { :first_name => 'KATIA ', :last_name => 'GONZALEZ MADRAZO', :email => 'info+123a@cursa.me',:password => 'K5mD42suwD', :group => 'Tercero A' },
        { :first_name => 'ERIKA ', :last_name => 'HUERTA LARA', :email => 'info+133a@cursa.me',:password => 'Zd1hoi4VaJ', :group => 'Tercero A' },
        { :first_name => 'RODRIGO ', :last_name => 'LAZARO DOMINGUEZ', :email => 'info+143a@cursa.me',:password => 'yW3VekqUwu', :group => 'Tercero A' },
        { :first_name => 'ALVARO YOEL', :last_name => 'LORENZO VAZQUEZ', :email => 'info+153a@cursa.me',:password => 'bCeaLvuc9Q', :group => 'Tercero A' },
        { :first_name => 'IVAN ', :last_name => 'MALDONADO GOMEZ', :email => 'info+163a@cursa.me',:password => 'G1NTqy5XK0', :group => 'Tercero A' },
        { :first_name => 'RUBEN ', :last_name => 'MENDOZA AMADO', :email => 'info+173a@cursa.me',:password => 'HPK5ABgkBE', :group => 'Tercero A' },
        { :first_name => 'CESAR ', :last_name => 'RAMIREZ BERNABE', :email => 'info+183a@cursa.me',:password => 'x1bbWK8Oo0', :group => 'Tercero A' },
        { :first_name => 'PAOLA ITZEL', :last_name => 'SANCHEZ QUIROZ', :email => 'info+193a@cursa.me',:password => 'grhUp02r2n', :group => 'Tercero A' },
        { :first_name => 'ZAHORY ', :last_name => 'SILVERIO LARA', :email => 'info+203a@cursa.me',:password => 'XxEguYem3j', :group => 'Tercero A' },
        { :first_name => 'BENJAMIN ', :last_name => 'VELAZQUEZ JOSE', :email => 'info+213a@cursa.me',:password => 'Zp0uXBPIvM', :group => 'Tercero A' },
        { :first_name => 'ALBERTO ARTURO', :last_name => 'VILCHIS GONZALEZ', :email => 'info+223a@cursa.me',:password => 'FUUwJXS2dH', :group => 'Tercero A' }
    ]

    alumnos3b = [
        { :first_name => 'CECILIA ', :last_name => 'ANDRES SANCHEZ', :email => 'info+013b@cursa.me',:password => 'tjlky6N00b', :group => 'Tercero B' },
        { :first_name => 'ARTEMIO ', :last_name => 'BECERRIL VELAZQUEZ', :email => 'info+023b@cursa.me',:password => 'R36WjwVaiZ', :group => 'Tercero B' },
        { :first_name => 'ARACELI ', :last_name => 'CRUZ CIRILO', :email => 'info+033b@cursa.me',:password => 'sWhD14oZGS', :group => 'Tercero B' },
        { :first_name => 'ARMANDO ', :last_name => 'CRUZ CIRILO', :email => 'info+043b@cursa.me',:password => 'EIeX41t7du', :group => 'Tercero B' },
        { :first_name => 'WILLIAM ', :last_name => 'CRUZ GONZALEZ', :email => 'info+053b@cursa.me',:password => 'yaAWCU5htt', :group => 'Tercero B' },
        { :first_name => 'SUHEYLI AKETZALI', :last_name => 'DE LOYOLA VIDAL', :email => 'info+063b@cursa.me',:password => '3DxzBZNDW5', :group => 'Tercero B' },
        { :first_name => 'YURIANAG ', :last_name => 'ENRIQUEZ BARRIOS', :email => 'info+073b@cursa.me',:password => '7nC2oCzMBk', :group => 'Tercero B' },
        { :first_name => 'SURIDAY ', :last_name => 'GARCIA CARDOSO', :email => 'info+083b@cursa.me',:password => 'i6N9yIRnyX', :group => 'Tercero B' },
        { :first_name => 'RAQUEL ', :last_name => 'GARCIA TRINIDAD', :email => 'info+093b@cursa.me',:password => 'OP0NG0kS7N', :group => 'Tercero B' },
        { :first_name => 'JUAN PABLO', :last_name => 'GARDUNO HERMENEGILDO', :email => 'info+103b@cursa.me',:password => '6ZyhEsbTdh', :group => 'Tercero B' },
        { :first_name => 'IRVING ', :last_name => 'GONZALEZ ORTA', :email => 'info+113b@cursa.me',:password => 'Snkj7TsevX', :group => 'Tercero B' },
        { :first_name => 'CRISTOPHER ', :last_name => 'JERONIMO QUIRINO', :email => 'info+123b@cursa.me',:password => 'ZXvUYRCNN5', :group => 'Tercero B' },
        { :first_name => 'JOAN TLANESI', :last_name => 'JIMENEZ GONZALEZ', :email => 'info+133b@cursa.me',:password => '46x8n5nPXo', :group => 'Tercero B' },
        { :first_name => 'EDUARDO ', :last_name => 'LARA SILVERIO', :email => 'info+143b@cursa.me',:password => 'nv8ZaW6yuq', :group => 'Tercero B' },
        { :first_name => 'AMSEL ', :last_name => 'LORENZO HERMENEGILDO', :email => 'info+153b@cursa.me',:password => 'xIS6GHmisZ', :group => 'Tercero B' },
        { :first_name => 'ERIC ', :last_name => 'MACARIO DOROTEO', :email => 'info+163b@cursa.me',:password => '0eF6rIWkJM', :group => 'Tercero B' },
        { :first_name => 'ELIZABETH ', :last_name => 'MARTINEZ GONZALEZ', :email => 'info+173b@cursa.me',:password => 'G9NafDDnnb', :group => 'Tercero B' },
        { :first_name => 'YOLOTZIN ', :last_name => 'NICOLAS BERNAL', :email => 'info+183b@cursa.me',:password => 'DTubbUtq2S', :group => 'Tercero B' },
        { :first_name => 'LUIS ALBERTO', :last_name => 'QUIRINO SANCHEZ', :email => 'info+193b@cursa.me',:password => 'b0bFZvQ6aM', :group => 'Tercero B' },
        { :first_name => 'BEANNY ', :last_name => 'REYES ANTONIO', :email => 'info+203b@cursa.me',:password => 'dK7FkWeVdk', :group => 'Tercero B' },
        { :first_name => 'CUITLAHUAC MOCTEZUMA', :last_name => 'SAMANO PERFECTO', :email => 'info+213b@cursa.me',:password => 'q5NrZ6NmH0', :group => 'Tercero B' },
        { :first_name => 'GUSTAVO ', :last_name => 'VENTURA REYES', :email => 'info+223b@cursa.me',:password => 'eys8w5vyQ8', :group => 'Tercero B' },
    ]

    #cursos de ingles
    ingles1a = Course.create(:title => "Ingles 1A", :init_date => "01/08/2012", :finish_date => "31/07/2013", :silabus => "...", :public_status => "private", :network_id => network_id)
    ingles1b = Course.create(:title => "Ingles 1B", :init_date => "01/08/2012", :finish_date => "31/07/2013", :silabus => "...", :public_status => "private", :network_id => network_id)
    ingles2a = Course.create(:title => "Ingles 2A", :init_date => "01/08/2012", :finish_date => "31/07/2013", :silabus => "...", :public_status => "private", :network_id => network_id)
    ingles2b = Course.create(:title => "Ingles 2B", :init_date => "01/08/2012", :finish_date => "31/07/2013", :silabus => "...", :public_status => "private", :network_id => network_id)
    ingles3a = Course.create(:title => "Ingles 3A", :init_date => "01/08/2012", :finish_date => "31/07/2013", :silabus => "...", :public_status => "private", :network_id => network_id)
    ingles3b = Course.create(:title => "Ingles 3B", :init_date => "01/08/2012", :finish_date => "31/07/2013", :silabus => "...", :public_status => "private", :network_id => network_id)

    #mestro de ingles
    mageo = { :first_name => 'Matilde', :last_name => 'Sanchez Vera', :email => 'maty.sanchez.23@gmail.com', :password => 'ytWrwi9t4A' }
    user = User.create :first_name => mageo[:first_name], :last_name => mageo[:last_name], :email => mageo[:email], :password => mageo[:password], :personal_url => "#{mageo[:first_name]}#{mageo[:last_name]}".split.join
    Permissioning.create :user_id => user.id, :role_id => '3', :network_id => network_id

    MembersInCourse.create :user_id => user.id, :course_id => ingles1a.id, :accepted => true, :owner => true, :network_id => network_id, :active_status => true
    MembersInCourse.create :user_id => user.id, :course_id => ingles1b.id, :accepted => true, :owner => true, :network_id => network_id, :active_status => true
    MembersInCourse.create :user_id => user.id, :course_id => ingles2a.id, :accepted => true, :owner => true, :network_id => network_id, :active_status => true
    MembersInCourse.create :user_id => user.id, :course_id => ingles2b.id, :accepted => true, :owner => true, :network_id => network_id, :active_status => true
    MembersInCourse.create :user_id => user.id, :course_id => ingles3a.id, :accepted => true, :owner => true, :network_id => network_id, :active_status => true
    MembersInCourse.create :user_id => user.id, :course_id => ingles3b.id, :accepted => true, :owner => true, :network_id => network_id, :active_status => true

    #dar de alta usuarios 1 ingles
    alumnos1a.each do |alumno|
      user = User.find_by_email(alumno[:email])
      MembersInCourse.create :user_id => user.id, :course_id => ingles1a.id, :accepted => true, :owner => false, :network_id => network_id, :active_status => true
    end
    alumnos1b.each do |alumno|
      user = User.find_by_email(alumno[:email])
      MembersInCourse.create :user_id => user.id, :course_id => ingles1b.id, :accepted => true, :owner => false, :network_id => network_id, :active_status => true
    end
    alumnos2a.each do |alumno|
      user = User.find_by_email(alumno[:email])
      MembersInCourse.create :user_id => user.id, :course_id => ingles2a.id, :accepted => true, :owner => false, :network_id => network_id, :active_status => true
    end
    alumnos2b.each do |alumno|
      user = User.find_by_email(alumno[:email])
      MembersInCourse.create :user_id => user.id, :course_id => ingles2b.id, :accepted => true, :owner => false, :network_id => network_id, :active_status => true
    end
    alumnos3a.each do |alumno|
      user = User.find_by_email(alumno[:email])
      MembersInCourse.create :user_id => user.id, :course_id => ingles3a.id, :accepted => true, :owner => false, :network_id => network_id, :active_status => true
    end
    alumnos3b.each do |alumno|
      user = User.find_by_email(alumno[:email])
      MembersInCourse.create :user_id => user.id, :course_id => ingles3b.id, :accepted => true, :owner => false, :network_id => network_id, :active_status => true
    end

    #lucero maestra de quimica
    lucero = User.where(:email=>"lucero.cuevas.666@gmail.com").first
    MembersInCourse.create :user_id => user.id, :course_id => 29, :accepted => true, :owner => true, :network_id => network_id, :active_status => true
    MembersInCourse.create :user_id => user.id, :course_id => 30, :accepted => true, :owner => true, :network_id => network_id, :active_status => true

    #formacion civica primeros
    FC1a = Course.create(:title => "Formacion Civica y Etica 1A", :init_date => "01/08/2012", :finish_date => "31/07/2013", :silabus => "...", :public_status => "private", :network_id => network_id)
    FC1b = Course.create(:title => "Formacion Civica y Etica 1B", :init_date => "01/08/2012", :finish_date => "31/07/2013", :silabus => "...", :public_status => "private", :network_id => network_id)

    #dar de alta usuarios a formacion civica y etica
    alumnos1a.each do |alumno|
      user = User.find_by_email(alumno[:email])
      MembersInCourse.create :user_id => user.id, :course_id => FC1a.id, :accepted => true, :owner => false, :network_id => network_id, :active_status => true
    end
    alumnos1b.each do |alumno|
      user = User.find_by_email(alumno[:email])
      MembersInCourse.create :user_id => user.id, :course_id => FC1b.id, :accepted => true, :owner => false, :network_id => network_id, :active_status => true
    end
end