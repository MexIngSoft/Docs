 
Api de token
https://developers.syscom.mx/oauth/token
datos enviados 
{
    "client_id": "{{client_id}}",
    "client_secret": "{{client_secret}}", 
    "grant_type": "client_credentials"
}
Resultado
 {
    "token_type": "Bearer",
    "expires_in": 31536000,
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImMyNjJmOWVkZTA4NDA5NDk1MTNmNDM3ZGU5YTQ1MzVjNDVmMWNlNjg2N2YyNTJlNmQyNWI0ZmZjZjI4ZjNhYzkzNzc2ZmY1ODUzZDU5OWNjIn0.eyJhdWQiOiJud2VqR1p5QXZYNTNvMWg0SDRROFc4SkVWUzlKWnVheSIsImp0aSI6ImMyNjJmOWVkZTA4NDA5NDk1MTNmNDM3ZGU5YTQ1MzVjNDVmMWNlNjg2N2YyNTJlNmQyNWI0ZmZjZjI4ZjNhYzkzNzc2ZmY1ODUzZDU5OWNjIiwiaWF0IjoxNzY4NjA0Mzk4LCJuYmYiOjE3Njg2MDQzOTgsImV4cCI6MTgwMDE0MDM5OCwic3ViIjoiIiwic2NvcGVzIjpbXX0.PZ6TDKjdkvRQopu3cmAmHz0BLKmRqgGsDKBEfItP0LbZbVPvkqTdwYj1gpRwbRamWYCly10oMaJtEJZairWi3JxaVgJXecioSd5AIVr1BZiIt8wZWl7PInFb5ioMt99MYbrv-M2MR2-ZQATCJpa48Cht5k-Qsi_STL5K8fr-eJjVBB2IxiG8FuFDrFy-Im5d_nGmkF460HRte_4LsIMY1tqdrwBEFQZc2ALPoxVLdOgu6Aj2uwqT4yYqOO3JJYg4zxlyEhtQDuOtKD9JX3pHAmrtxGibDCrVcb9HGY6_DOB4DSMy41SGwSndZZEwM_WWc-bjpvCczbG6t2ngT6YPH0pFVddTvG-tBmN_NoDZhhDlWPGGVY1Ts5bO3-wdZgG9OTm_DoYzrDYYY0BpruTmFBlfpI5iTPG5Ee6l8pXDFFS5262VDGkcIBiCC6VCcRmGZYPLnQNveFjlH-YRTSLAzp3_4Ib-CIWMwsSQZZA_jXZ8Wkbo7dS_Lp6oXX2fNA8vfmKnb2S9uzn7kqbtru2HZlwzf0lp0zDVE1pbSQ55AADSX0dWuNW5qc4O5-69Z-gQMWTLC27oZnPGkOtjnwjBZUSLnlAwkHsH3Owh0UwHrZBxpQ0M3FipLTFX7G3ykffClYZbdYHf6glDDD5z65gTHYOMkhC4F2-Lx9yQGPw_Mb8"
}

Api categoría
https://developers.syscom.mx/api/v1/categorias
resultado
[
    {
        "id": "22",
        "nombre": "Videovigilancia",
        "nivel": 1
    },
    {
        "id": "25",
        "nombre": "Radiocomunicación",
        "nivel": 1
    },
    {
        "id": "26",
        "nombre": "Redes e IT",
        "nivel": 1
    },
    {
        "id": "27",
        "nombre": "IoT / GPS / Telemática y Señalización Audiovisual",
        "nivel": 1
    },
    {
        "id": "30",
        "nombre": "Energía / Herramientas",
        "nivel": 1
    },
    {
        "id": "32",
        "nombre": "Automatización   e Intrusión",
        "nivel": 1
    },
    {
        "id": "37",
        "nombre": "Control  de Acceso ",
        "nivel": 1
    },
    {
        "id": "38",
        "nombre": "Detección  de Fuego",
        "nivel": 1
    },
    {
        "id": "65747",
        "nombre": "Marketing",
        "nivel": 1
    },
    {
        "id": "65811",
        "nombre": "Cableado Estructurado",
        "nivel": 1
    },
    {
        "id": "66523",
        "nombre": "Audio y Video",
        "nivel": 1
    },
    {
        "id": "66630",
        "nombre": "Robots e Industrial",
        "nivel": 1
    }
]
Api categoría por id
https://developers.syscom.mx/api/v1/categorias/65811
resultado
{
    "id": "65811",
    "nombre": "Cableado Estructurado",
    "nivel": "1",
    "origen": [],
    "subcategorias": [
        {
            "id": "65812",
            "nombre": "Cable",
            "nivel": "2"
        },
        {
            "id": "65813",
            "nombre": "Cableado de Cobre",
            "nivel": "2"
        },
        {
            "id": "65814",
            "nombre": "Fibra Óptica",
            "nivel": "2"
        },
        {
            "id": "65815",
            "nombre": "Racks y Gabinetes",
            "nivel": "2"
        },
        {
            "id": "65816",
            "nombre": "Canalización",
            "nivel": "2"
        },
        {
            "id": "65843",
            "nombre": "Charola",
            "nivel": "2"
        },
        {
            "id": "65915",
            "nombre": "Conectores ",
            "nivel": "2"
        },
        {
            "id": "66054",
            "nombre": "PDU",
            "nivel": "2"
        }
    ]
}
Api de marcas
https://developers.syscom.mx/api/v1/marcas
resultado
[
    {
        "id": "sinmarca",
        "nombre": "sinmarca"
    },
    {
        "id": "syscom",
        "nombre": "Syscom"
    },
    {
        "id": 0,
        "nombre": "0"
    },
    {
        "id": 1,
        "nombre": "1"
    },
    {
        "id": "2gig",
        "nombre": "2gig"
    },
    {
        "id": "3cx",
        "nombre": "3CX"
    },
    {
        "id": "3icorporation",
        "nombre": "3i CORPORATION"
    },
    {
        "id": "3m",
        "nombre": "3M"
    },
    {
        "id": "abell",
        "nombre": "ABELL"
    },
    {
        "id": "abloy",
        "nombre": "ABLOY"
    },
    {
        "id": "absen",
        "nombre": "ABSEN"
    },
    {
        "id": "accesspro",
        "nombre": "AccessPRO"
    },
    {
        "id": "accessproindustrial",
        "nombre": "AccessPRO Industrial"
    },
    {
        "id": "acero",
        "nombre": "ACERO"
    },
    {
        "id": "acti",
        "nombre": "ACTI"
    },
    {
        "id": "actisense",
        "nombre": "ACTISENSE"
    },
    {
        "id": "acuitybrands",
        "nombre": "ACUITY BRANDS"
    },
    {
        "id": "adata",
        "nombre": "ADATA"
    },
    {
        "id": "ademco",
        "nombre": "ADEMCO"
    },
    {
        "id": "ademcohoneywell",
        "nombre": "ADEMCO (HONEYWELL)"
    },
    {
        "id": "advancetecindustriesinc",
        "nombre": "ADVANCETEC INDUSTRIES INC"
    },
    {
        "id": "aea",
        "nombre": "AEA"
    },
    {
        "id": "afore",
        "nombre": "AFORE"
    },
    {
        "id": "airbus",
        "nombre": "AIRBUS"
    },
    {
        "id": "airmar",
        "nombre": "AIRMAR"
    },
    {
        "id": "airx",
        "nombre": "AIRX"
    },
    {
        "id": "akubela",
        "nombre": "AKUBELA"
    },
    {
        "id": "akuvox",
        "nombre": "AKUVOX"
    },
    {
        "id": "alarmcontrolsassaabloy",
        "nombre": "ALARM CONTROLS-ASSA ABLOY"
    },
    {
        "id": "alarmcom",
        "nombre": "ALARM.COM"
    },
    {
        "id": "alean",
        "nombre": "ALEAN"
    },
    {
        "id": "aleph",
        "nombre": "ALEPH"
    },
    {
        "id": "alerton",
        "nombre": "ALERTON"
    },
    {
        "id": "alfatronics",
        "nombre": "ALFATRONICS"
    },
    {
        "id": "alliedtelesis",
        "nombre": "ALLIED TELESIS"
    },
    {
        "id": "alltercoroboticseood",
        "nombre": "ALLTERCO ROBOTICS EOOD"
    },
    {
        "id": "also",
        "nombre": "ALSO"
    },
    {
        "id": "altafidelidad",
        "nombre": "ALTA FIDELIDAD"
    },
    {
        "id": "altalabs",
        "nombre": "ALTA LABS"
    },
    {
        "id": "altaitechnologies",
        "nombre": "ALTAI TECHNOLOGIES"
    },
    {
        "id": "altronix",
        "nombre": "ALTRONIX"
    },
    {
        "id": "alvarado",
        "nombre": "ALVARADO"
    },
    {
        "id": "alvarion",
        "nombre": "ALVARION"
    },
    {
        "id": "alvarionltd",
        "nombre": "ALVARION LTD"
    },
    {
        "id": "amancowavin",
        "nombre": "AMANCO-WAVIN"
    },
    {
        "id": "americanearthanchors",
        "nombre": "AMERICAN EARTH ANCHORS"
    },
    {
        "id": "amphenol",
        "nombre": "AMPHENOL"
    },
    {
        "id": "amprobe",
        "nombre": "AMPROBE"
    },
    {
        "id": "anclo",
        "nombre": "ANCLO"
    },
    {
        "id": "andrew",
        "nombre": "ANDREW"
    },
    {
        "id": "andrewcommscope",
        "nombre": "ANDREW / COMMSCOPE"
    },
    {
        "id": "anjielo",
        "nombre": "ANJIELO"
    },
    {
        "id": "antennaspecialists",
        "nombre": "ANTENNA SPECIALISTS"
    },
    {
        "id": "aoc",
        "nombre": "AOC"
    },
    {
        "id": "apacopto",
        "nombre": "APAC OPTO"
    },
    {
        "id": "apc",
        "nombre": "APC"
    },
    {
        "id": "apem",
        "nombre": "APEM"
    },
    {
        "id": "aplicacionestecnologicas",
        "nombre": "APLICACIONES TECNOLOGICAS"
    },
    {
        "id": "apollo",
        "nombre": "APOLLO"
    },
    {
        "id": "apple",
        "nombre": "APPLE"
    },
    {
        "id": "arduinollc",
        "nombre": "ARDUINO LLC"
    },
    {
        "id": "arecontvision",
        "nombre": "ARECONT VISION"
    },
    {
        "id": "arquero",
        "nombre": "ARQUERO"
    },
    {
        "id": "arrow",
        "nombre": "ARROW"
    },
    {
        "id": "assaabloy",
        "nombre": "ASSA ABLOY"
    },
    {
        "id": "astron",
        "nombre": "ASTRON"
    },
    {
        "id": "astronicstestsystemsinc",
        "nombre": "ASTRONICS TEST SYSTEMS INC"
    },
    {
        "id": "asus",
        "nombre": "ASUS"
    },
    {
        "id": "att",
        "nombre": "AT&T"
    },
    {
        "id": "aten",
        "nombre": "ATEN"
    },
    {
        "id": "atheros",
        "nombre": "ATHEROS"
    },
    {
        "id": "atlona",
        "nombre": "ATLONA"
    },
    {
        "id": "audiotechnica",
        "nombre": "AUDIO-TECHNICA"
    },
    {
        "id": "aufit",
        "nombre": "AUFIT"
    },
    {
        "id": "avcom",
        "nombre": "AVCOM"
    },
    {
        "id": "avigilon",
        "nombre": "AVIGILON"
    },
    {
        "id": "awenterprises",
        "nombre": "AW ENTERPRISES"
    },
    {
        "id": "axxonsmart",
        "nombre": "AXXON SMART"
    },
    {
        "id": "balamrush",
        "nombre": "BALAMRUSH"
    },
    {
        "id": "bandit",
        "nombre": "BAND IT"
    },
    {
        "id": "bcdvideo",
        "nombre": "BCDVideo"
    },
    {
        "id": "bea",
        "nombre": "BEA"
    },
    {
        "id": "beeelectronicsinc",
        "nombre": "BEE ELECTRONICS INC"
    },
    {
        "id": "belairnetworks",
        "nombre": "BELAIR NETWORKS"
    },
    {
        "id": "belden",
        "nombre": "BELDEN"
    },
    {
        "id": "benotto",
        "nombre": "BENOTTO"
    },
    {
        "id": "benq",
        "nombre": "BENQ"
    },
    {
        "id": "bigfans",
        "nombre": "BIG FANS"
    },
    {
        "id": "bird",
        "nombre": "BIRD"
    },
    {
        "id": "birdtechnologies",
        "nombre": "BIRD TECHNOLOGIES"
    },
    {
        "id": "blackanddecker",
        "nombre": "BLACK AND DECKER"
    },
    {
        "id": "blueparrott",
        "nombre": "BLUEPARROTT"
    },
    {
        "id": "boseprofessional",
        "nombre": "BOSE PROFESSIONAL"
    },
    {
        "id": "brateck",
        "nombre": "BRATECK"
    },
    {
        "id": "bravoled",
        "nombre": "BRAVOLED"
    },
    {
        "id": "brilliant",
        "nombre": "BRILLIANT"
    },
    {
        "id": "brukenassaabloy",
        "nombre": "BRUKEN ASSA ABLOY"
    },
    {
        "id": "bsjtechnology",
        "nombre": "BSJ TECHNOLOGY"
    },
    {
        "id": "bunkerseguridad",
        "nombre": "BUNKER SEGURIDAD"
    },
    {
        "id": "burndy",
        "nombre": "BURNDY"
    },
    {
        "id": "cmap",
        "nombre": "C-MAP"
    },
    {
        "id": "cnord",
        "nombre": "C.NORD"
    },
    {
        "id": "cadexelectronicsinc",
        "nombre": "Cadex Electronics Inc"
    },
    {
        "id": "cambiumnetworks",
        "nombre": "CAMBIUM NETWORKS"
    },
    {
        "id": "cambiumnetworksinc",
        "nombre": "CAMBIUM NETWORKS INC."
    },
    {
        "id": "came",
        "nombre": "CAME"
    },
    {
        "id": "camesa",
        "nombre": "CAMESA"
    },
    {
        "id": "carl",
        "nombre": "CARL"
    },
    {
        "id": "catusa",
        "nombre": "CATUSA"
    },
    {
        "id": "cdata",
        "nombre": "CDATA"
    },
    {
        "id": "celwave",
        "nombre": "CELWAVE"
    },
    {
        "id": "century",
        "nombre": "Century"
    },
    {
        "id": "ces",
        "nombre": "CES"
    },
    {
        "id": "charofil",
        "nombre": "CHAROFIL"
    },
    {
        "id": "chint",
        "nombre": "CHINT"
    },
    {
        "id": "cimarrontechnologies",
        "nombre": "CIMARRON TECHNOLOGIES"
    },
    {
        "id": "citylocks",
        "nombre": "CITYLOCKS"
    },
    {
        "id": "cogreenenregygrouplimited",
        "nombre": "CO GREEN ENREGY GROUP LIMITED"
    },
    {
        "id": "cobham",
        "nombre": "COBHAM"
    },
    {
        "id": "cobra",
        "nombre": "COBRA"
    },
    {
        "id": "cobrawirecable",
        "nombre": "COBRA WIRE & CABLE"
    },
    {
        "id": "coby",
        "nombre": "COBY"
    },
    {
        "id": "code3",
        "nombre": "CODE 3"
    },
    {
        "id": "coleman",
        "nombre": "COLEMAN"
    },
    {
        "id": "commbox",
        "nombre": "Commbox"
    },
    {
        "id": "commscope",
        "nombre": "COMMSCOPE"
    },
    {
        "id": "commscopeandrew",
        "nombre": "COMMSCOPE (ANDREW)"
    },
    {
        "id": "compustar",
        "nombre": "COMPUSTAR"
    },
    {
        "id": "computar",
        "nombre": "COMPUTAR"
    },
    {
        "id": "comunello",
        "nombre": "COMUNELLO"
    },
    {
        "id": "concox",
        "nombre": "CONCOX"
    },
    {
        "id": "conductoresmonterrey",
        "nombre": "CONDUCTORES MONTERREY"
    },
    {
        "id": "condumex",
        "nombre": "CONDUMEX"
    },
    {
        "id": "conermex",
        "nombre": "CONERMEX"
    },
    {
        "id": "coolmay",
        "nombre": "COOLMAY"
    },
    {
        "id": "cosmiconn",
        "nombre": "COSMICONN"
    },
    {
        "id": "cotek",
        "nombre": "COTEK"
    },
    {
        "id": "cpi",
        "nombre": "CPI"
    },
    {
        "id": "crescend",
        "nombre": "CRESCEND"
    },
    {
        "id": "cresco",
        "nombre": "CRESCO"
    },
    {
        "id": "crow",
        "nombre": "CROW"
    },
    {
        "id": "csc",
        "nombre": "CSC"
    },
    {
        "id": "csi",
        "nombre": "CSI"
    },
    {
        "id": "csun",
        "nombre": "CSUN"
    },
    {
        "id": "cuprumurrea",
        "nombre": "CUPRUM URREA"
    },
    {
        "id": "currentaudio",
        "nombre": "CURRENT AUDIO"
    },
    {
        "id": "cyberpower",
        "nombre": "CYBERPOWER"
    },
    {
        "id": "dlink",
        "nombre": "D-LINK"
    },
    {
        "id": "dali",
        "nombre": "DALI"
    },
    {
        "id": "damm",
        "nombre": "DAMM"
    },
    {
        "id": "datacake",
        "nombre": "DATACAKE"
    },
    {
        "id": "datashield",
        "nombre": "DATASHIELD"
    },
    {
        "id": "datasoft",
        "nombre": "DataSoft"
    },
    {
        "id": "davidclark",
        "nombre": "DAVID CLARK"
    },
    {
        "id": "daystar",
        "nombre": "DAYSTAR"
    },
    {
        "id": "dbspectra",
        "nombre": "DB SPECTRA"
    },
    {
        "id": "decibel",
        "nombre": "DECIBEL"
    },
    {
        "id": "delta",
        "nombre": "DELTA"
    },
    {
        "id": "deltabox",
        "nombre": "DELTA BOX"
    },
    {
        "id": "deskcamera",
        "nombre": "DESKCAMERA"
    },
    {
        "id": "detex",
        "nombre": "DETEX"
    },
    {
        "id": "deye",
        "nombre": "DEYE"
    },
    {
        "id": "diamondantenna",
        "nombre": "DIAMOND ANTENNA"
    },
    {
        "id": "digifort",
        "nombre": "DIGIFORT"
    },
    {
        "id": "digikey",
        "nombre": "DIGIKEY"
    },
    {
        "id": "ditec",
        "nombre": "DITEC"
    },
    {
        "id": "ditek",
        "nombre": "DITEK"
    },
    {
        "id": "dji",
        "nombre": "DJI"
    },
    {
        "id": "dks",
        "nombre": "DKS"
    },
    {
        "id": "dksdoorking",
        "nombre": "DKS DOORKING"
    },
    {
        "id": "dmt",
        "nombre": "DMT"
    },
    {
        "id": "dobot",
        "nombre": "DOBOT"
    },
    {
        "id": "dongcheng",
        "nombre": "DONG CHENG"
    },
    {
        "id": "doorking",
        "nombre": "DOORKING"
    },
    {
        "id": "dormakaba",
        "nombre": "DORMAKABA"
    },
    {
        "id": "dragino",
        "nombre": "DRAGINO"
    },
    {
        "id": "dremel",
        "nombre": "DREMEL"
    },
    {
        "id": "dsc",
        "nombre": "DSC"
    },
    {
        "id": "duracell",
        "nombre": "DURACELL"
    },
    {
        "id": "e",
        "nombre": "e"
    },
    {
        "id": "e2v",
        "nombre": "E2V"
    },
    {
        "id": "eastron",
        "nombre": "EASTRON"
    },
    {
        "id": "easywisp",
        "nombre": "EASYWISP"
    },
    {
        "id": "eaton",
        "nombre": "EATON"
    },
    {
        "id": "ecco",
        "nombre": "ECCO"
    },
    {
        "id": "ecogreenenergy",
        "nombre": "ECO GREEN ENERGY"
    },
    {
        "id": "ecogreenenergygrouplimited",
        "nombre": "ECO GREEN ENERGY GROUP LIMITED"
    },
    {
        "id": "ecoflow",
        "nombre": "ECOFLOW"
    },
    {
        "id": "edisecure",
        "nombre": "EDISECURE"
    },
    {
        "id": "edsyn",
        "nombre": "EDSYN"
    },
    {
        "id": "edwards",
        "nombre": "Edwards"
    },
    {
        "id": "efjohnson",
        "nombre": "EF-Johnson"
    },
    {
        "id": "egiaudiosolution",
        "nombre": "EGI AUDIO SOLUTION"
    },
    {
        "id": "egiaudiosolutions",
        "nombre": "EGI AUDIO SOLUTIONS"
    },
    {
        "id": "elainnovation",
        "nombre": "ELA Innovation"
    },
    {
        "id": "eldes",
        "nombre": "ELDES"
    },
    {
        "id": "electronicdesign",
        "nombre": "ELECTRONIC DESIGN"
    },
    {
        "id": "elitesolar",
        "nombre": "ELITE SOLAR"
    },
    {
        "id": "elkproducts",
        "nombre": "ELK PRODUCTS"
    },
    {
        "id": "emerlight",
        "nombre": "EMER LIGHT"
    },
    {
        "id": "emesse",
        "nombre": "EMESSE"
    },
    {
        "id": "emrcorporation",
        "nombre": "EMR CORPORATION"
    },
    {
        "id": "endura",
        "nombre": "ENDURA"
    },
    {
        "id": "energysistem",
        "nombre": "ENERGY SISTEM"
    },
    {
        "id": "enfora",
        "nombre": "ENFORA"
    },
    {
        "id": "enforcersecolarm",
        "nombre": "ENFORCER SECOLARM"
    },
    {
        "id": "engenius",
        "nombre": "ENGENIUS"
    },
    {
        "id": "enterpriseelectronics",
        "nombre": "ENTERPRISE ELECTRONICS"
    },
    {
        "id": "epcom",
        "nombre": "EPCOM"
    },
    {
        "id": "epcomax",
        "nombre": "EPCOM AX"
    },
    {
        "id": "epcomindustrial",
        "nombre": "EPCOM INDUSTRIAL"
    },
    {
        "id": "epcomindustrialsignaling",
        "nombre": "EPCOM INDUSTRIAL SIGNALING"
    },
    {
        "id": "epcompowerlinebyritar",
        "nombre": "EPCOM POWER LINE BY RITAR"
    },
    {
        "id": "epcompowerline",
        "nombre": "EPCOM POWERLINE"
    },
    {
        "id": "epcomproaudio",
        "nombre": "EPCOM PROAUDIO"
    },
    {
        "id": "epcomprofessional",
        "nombre": "EPCOM PROFESSIONAL"
    },
    {
        "id": "epcomtitanium",
        "nombre": "EPCOM TITANIUM"
    },
    {
        "id": "epever",
        "nombre": "EPEVER"
    },
    {
        "id": "eprint",
        "nombre": "EPRINT"
    },
    {
        "id": "epsolar",
        "nombre": "EPSOLAR"
    },
    {
        "id": "equysis",
        "nombre": "EQUYSIS"
    },
    {
        "id": "erdmsolar",
        "nombre": "ERDMSOLAR"
    },
    {
        "id": "escort",
        "nombre": "ESCORT"
    },
    {
        "id": "eta",
        "nombre": "ETA"
    },
    {
        "id": "etsolar",
        "nombre": "ETSOLAR"
    },
    {
        "id": "etsolarelitesolar",
        "nombre": "ETSOLAR / ELITEsolar"
    },
    {
        "id": "eventide",
        "nombre": "EVENTIDE"
    },
    {
        "id": "exide",
        "nombre": "EXIDE"
    },
    {
        "id": "ezviz",
        "nombre": "EZVIZ"
    },
    {
        "id": "fst",
        "nombre": "F.S.T."
    },
    {
        "id": "faac",
        "nombre": "FAAC"
    },
    {
        "id": "fanvil",
        "nombre": "FANVIL"
    },
    {
        "id": "fargo",
        "nombre": "FARGO"
    },
    {
        "id": "federal",
        "nombre": "Federal"
    },
    {
        "id": "federalapd",
        "nombre": "FEDERAL APD"
    },
    {
        "id": "federalsignal",
        "nombre": "FEDERAL SIGNAL"
    },
    {
        "id": "federalsignalindustrial",
        "nombre": "FEDERAL SIGNAL INDUSTRIAL"
    },
    {
        "id": "federalsignalvama",
        "nombre": "FEDERAL SIGNAL VAMA"
    },
    {
        "id": "fiberhome",
        "nombre": "FIBERHOME"
    },
    {
        "id": "fibox",
        "nombre": "FIBOX"
    },
    {
        "id": "fibraamrica",
        "nombre": "FIBRAAMÉRICA"
    },
    {
        "id": "fiplex",
        "nombre": "FIPLEX"
    },
    {
        "id": "firealarmsinc",
        "nombre": "FIRE ALARMS INC."
    },
    {
        "id": "firelite",
        "nombre": "FIRE-LITE"
    },
    {
        "id": "fire4systems",
        "nombre": "FIRE4 SYSTEMS"
    },
    {
        "id": "fireegg",
        "nombre": "FIREEGG"
    },
    {
        "id": "firstalert",
        "nombre": "FIRST ALERT"
    },
    {
        "id": "flir",
        "nombre": "FLIR"
    },
    {
        "id": "fluke",
        "nombre": "FLUKE"
    },
    {
        "id": "flukenetworks",
        "nombre": "FLUKE NETWORKS"
    },
    {
        "id": "freedomcommunicationtechnologies",
        "nombre": "FREEDOM COMMUNICATION TECHNOLOGIES"
    },
    {
        "id": "freescale",
        "nombre": "FREESCALE"
    },
    {
        "id": "freewave",
        "nombre": "FREEWAVE"
    },
    {
        "id": "fronius",
        "nombre": "FRONIUS"
    },
    {
        "id": "fujifilm",
        "nombre": "FUJIFILM"
    },
    {
        "id": "gaitronics",
        "nombre": "GAITRONICS"
    },
    {
        "id": "gamberjohnson",
        "nombre": "GAMBERJOHNSON"
    },
    {
        "id": "ganetecsolutions",
        "nombre": "GANETEC SOLUTIONS"
    },
    {
        "id": "garmin",
        "nombre": "GARMIN"
    },
    {
        "id": "ge",
        "nombre": "GE"
    },
    {
        "id": "gemeco",
        "nombre": "GEMECO"
    },
    {
        "id": "generac",
        "nombre": "GENERAC"
    },
    {
        "id": "genesis",
        "nombre": "GENESIS"
    },
    {
        "id": "genetec",
        "nombre": "GENETEC"
    },
    {
        "id": "georgeforeman",
        "nombre": "GEORGE FOREMAN"
    },
    {
        "id": "getac",
        "nombre": "GETAC"
    },
    {
        "id": "gewiss",
        "nombre": "GEWISS"
    },
    {
        "id": "gigabyte",
        "nombre": "GIGABYTE"
    },
    {
        "id": "glc",
        "nombre": "GLC"
    },
    {
        "id": "globalsat",
        "nombre": "GLOBALSAT"
    },
    {
        "id": "globalstar",
        "nombre": "GLOBALSTAR"
    },
    {
        "id": "gnr",
        "nombre": "GNR"
    },
    {
        "id": "gocontrol",
        "nombre": "GoControl"
    },
    {
        "id": "good2go",
        "nombre": "GOOD 2 GO"
    },
    {
        "id": "google",
        "nombre": "GOOGLE"
    },
    {
        "id": "gpsmonitor",
        "nombre": "GPS MONITOR"
    },
    {
        "id": "grandstream",
        "nombre": "GRANDSTREAM"
    },
    {
        "id": "greenc",
        "nombre": "GREENC"
    },
    {
        "id": "greenlee",
        "nombre": "GREENLEE"
    },
    {
        "id": "growatt",
        "nombre": "GROWATT"
    },
    {
        "id": "grundfos",
        "nombre": "GRUNDFOS"
    },
    {
        "id": "grupoalbar",
        "nombre": "GRUPO ALBAR"
    },
    {
        "id": "grupodelaroche",
        "nombre": "GRUPO DE LA ROCHE"
    },
    {
        "id": "gst",
        "nombre": "GST"
    },
    {
        "id": "guardiantrafficsystems",
        "nombre": "GUARDIAN TRAFFIC SYSTEMS"
    },
    {
        "id": "guestinternet",
        "nombre": "GUEST INTERNET"
    },
    {
        "id": "gvi",
        "nombre": "GVI"
    },
    {
        "id": "hakko",
        "nombre": "HAKKO"
    },
    {
        "id": "hanwhatechwinwisenet",
        "nombre": "Hanwha Techwin Wisenet"
    },
    {
        "id": "hertasecurity",
        "nombre": "HERTA SECURITY"
    },
    {
        "id": "hesassaabloy",
        "nombre": "HES - ASSA ABLOY"
    },
    {
        "id": "hewlettpackardenterprisehp",
        "nombre": "HEWLETT PACKARD ENTERPRISE(HP)"
    },
    {
        "id": "hiboost",
        "nombre": "HIBOOST"
    },
    {
        "id": "hiboxtxpro",
        "nombre": "HIBOX (TXPRO)"
    },
    {
        "id": "hid",
        "nombre": "HID"
    },
    {
        "id": "hidpcsc",
        "nombre": "HID (PCSC)"
    },
    {
        "id": "hikmicro",
        "nombre": "HIKMICRO"
    },
    {
        "id": "hikrobot",
        "nombre": "HIKROBOT"
    },
    {
        "id": "hiksemibyhikvision",
        "nombre": "HIKSEMI by HIKVISION"
    },
    {
        "id": "hikvision",
        "nombre": "HIKVISION"
    },
    {
        "id": "hilookbyhikvision",
        "nombre": "HiLook by HIKVISION"
    },
    {
        "id": "hochiki",
        "nombre": "HOCHIKI"
    },
    {
        "id": "hoffman",
        "nombre": "HOFFMAN"
    },
    {
        "id": "honeywell",
        "nombre": "HONEYWELL"
    },
    {
        "id": "honeywellanalytics",
        "nombre": "HONEYWELL ANALYTICS"
    },
    {
        "id": "honeywellbms",
        "nombre": "HONEYWELL BMS"
    },
    {
        "id": "honeywellfarenhytseries",
        "nombre": "HONEYWELL FARENHYT SERIES"
    },
    {
        "id": "honeywellhomeresideo",
        "nombre": "HONEYWELL HOME RESIDEO"
    },
    {
        "id": "honeywellpava",
        "nombre": "HONEYWELL PAVA"
    },
    {
        "id": "hoymiles",
        "nombre": "HOYMILES"
    },
    {
        "id": "hp",
        "nombre": "HP"
    },
    {
        "id": "huawei",
        "nombre": "HUAWEI"
    },
    {
        "id": "huaweiekit",
        "nombre": "HUAWEI eKIT"
    },
    {
        "id": "huaweifusionsolar",
        "nombre": "HUAWEI FUSIONSOLAR"
    },
    {
        "id": "hubbell",
        "nombre": "HUBBELL"
    },
    {
        "id": "hubbellburndy",
        "nombre": "HUBBELL BURNDY"
    },
    {
        "id": "hubbellincendios",
        "nombre": "HUBBELL INCENDIOS"
    },
    {
        "id": "hubbellkillark",
        "nombre": "HUBBELL KILLARK"
    },
    {
        "id": "hubbelltaymac",
        "nombre": "HUBBELL TAYMAC"
    },
    {
        "id": "hubbellwiringdevices",
        "nombre": "HUBBELL WIRING DEVICES"
    },
    {
        "id": "hubitat",
        "nombre": "HUBITAT"
    },
    {
        "id": "hubitatinc",
        "nombre": "HUBITAT INC"
    },
    {
        "id": "hustler",
        "nombre": "HUSTLER"
    },
    {
        "id": "hyperlux",
        "nombre": "HYPERLUX"
    },
    {
        "id": "hyperspike",
        "nombre": "HYPERSPIKE"
    },
    {
        "id": "hysecurity",
        "nombre": "HYSECURITY"
    },
    {
        "id": "ibernex",
        "nombre": "IBERNEX"
    },
    {
        "id": "icom",
        "nombre": "ICOM"
    },
    {
        "id": "icomameriainc",
        "nombre": "ICOM AMERIA INC"
    },
    {
        "id": "ict",
        "nombre": "ICT"
    },
    {
        "id": "idemiamorpho",
        "nombre": "IDEMIA (MORPHO)"
    },
    {
        "id": "identytech",
        "nombre": "IDENTYTECH"
    },
    {
        "id": "idis",
        "nombre": "IDIS"
    },
    {
        "id": "idp",
        "nombre": "IDP"
    },
    {
        "id": "ies",
        "nombre": "IES"
    },
    {
        "id": "ignitenet",
        "nombre": "IGNITENET"
    },
    {
        "id": "ikea",
        "nombre": "IKEA"
    },
    {
        "id": "index",
        "nombre": "INDEX"
    },
    {
        "id": "indiana",
        "nombre": "INDIANA"
    },
    {
        "id": "industrialbyaccesspro",
        "nombre": "industrial by accesspro"
    },
    {
        "id": "infinova",
        "nombre": "INFINOVA"
    },
    {
        "id": "infortrend",
        "nombre": "INFORTREND"
    },
    {
        "id": "inncom",
        "nombre": "INNCOM"
    },
    {
        "id": "innolock",
        "nombre": "INNOLOCK"
    },
    {
        "id": "intel",
        "nombre": "INTEL"
    },
    {
        "id": "iomnissurveillancesolutions",
        "nombre": "IOMNIS SURVEILLANCE SOLUTIONS"
    },
    {
        "id": "irisid",
        "nombre": "IRIS ID"
    },
    {
        "id": "isotruss",
        "nombre": "ISOTRUSS"
    },
    {
        "id": "iss",
        "nombre": "ISS"
    },
    {
        "id": "jabaz",
        "nombre": "JABAZ"
    },
    {
        "id": "jabra",
        "nombre": "JABRA"
    },
    {
        "id": "jabsco",
        "nombre": "JABSCO"
    },
    {
        "id": "jasco",
        "nombre": "JASCO"
    },
    {
        "id": "jimiiot",
        "nombre": "JIMIIOT"
    },
    {
        "id": "jirous",
        "nombre": "JIROUS"
    },
    {
        "id": "jupiter",
        "nombre": "JUPITER"
    },
    {
        "id": "jvc",
        "nombre": "JVC"
    },
    {
        "id": "jvckenwood",
        "nombre": "JVC  KENWOOD"
    },
    {
        "id": "jvckenwoodcorporation",
        "nombre": "JVC  KENWOOD CORPORATION"
    },
    {
        "id": "jvsg",
        "nombre": "JVSG"
    },
    {
        "id": "jwj",
        "nombre": "JWJ"
    },
    {
        "id": "keenon",
        "nombre": "KEENON"
    },
    {
        "id": "kenwood",
        "nombre": "KENWOOD"
    },
    {
        "id": "kerlink",
        "nombre": "KERLINK"
    },
    {
        "id": "kester",
        "nombre": "KESTER"
    },
    {
        "id": "keyscandormakaba",
        "nombre": "KEYSCAN-DORMAKABA"
    },
    {
        "id": "khomp",
        "nombre": "KHOMP"
    },
    {
        "id": "kidde",
        "nombre": "KIDDE"
    },
    {
        "id": "kingston",
        "nombre": "Kingston"
    },
    {
        "id": "kleintools",
        "nombre": "KLEIN TOOLS"
    },
    {
        "id": "klipextreme",
        "nombre": "KLIP EXTREME"
    },
    {
        "id": "koblenz",
        "nombre": "KOBLENZ"
    },
    {
        "id": "kocom",
        "nombre": "KOCOM"
    },
    {
        "id": "kpperformance",
        "nombre": "KP PERFORMANCE"
    },
    {
        "id": "kyocera",
        "nombre": "KYOCERA"
    },
    {
        "id": "l1i9dentitysoluciones",
        "nombre": "L-1 I9DENTITY SOLUCIONES"
    },
    {
        "id": "lcom",
        "nombre": "L-COM"
    },
    {
        "id": "l3harris",
        "nombre": "L3Harris"
    },
    {
        "id": "laird",
        "nombre": "LAIRD"
    },
    {
        "id": "landwell",
        "nombre": "LANDWELL"
    },
    {
        "id": "larsen",
        "nombre": "larsen"
    },
    {
        "id": "larsenantenas",
        "nombre": "larsen antenas"
    },
    {
        "id": "larsenantennas",
        "nombre": "LARSEN ANTENNAS"
    },
    {
        "id": "leainternational",
        "nombre": "LEA International"
    },
    {
        "id": "leapton",
        "nombre": "LEAPTON"
    },
    {
        "id": "lenovo",
        "nombre": "LENOVO"
    },
    {
        "id": "leviton",
        "nombre": "LEVITON"
    },
    {
        "id": "lfacoustics",
        "nombre": "LFACOUSTICS"
    },
    {
        "id": "lg",
        "nombre": "LG"
    },
    {
        "id": "liftmaster",
        "nombre": "LIFTMASTER"
    },
    {
        "id": "liftpro",
        "nombre": "LiftPRO"
    },
    {
        "id": "linear",
        "nombre": "Linear"
    },
    {
        "id": "linkedpro",
        "nombre": "LINKEDPRO"
    },
    {
        "id": "linkedprobyepcom",
        "nombre": "LINKEDPRO BY EPCOM"
    },
    {
        "id": "linkedprobyfiberhome",
        "nombre": "LINKEDPRO BY FIBERHOME"
    },
    {
        "id": "linksfield",
        "nombre": "LINKSFIELD"
    },
    {
        "id": "littlegiantladdersystems",
        "nombre": "Little Giant Ladder Systems"
    },
    {
        "id": "lndu",
        "nombre": "LNDU"
    },
    {
        "id": "lock",
        "nombre": "LOCK"
    },
    {
        "id": "longi",
        "nombre": "LONGI"
    },
    {
        "id": "loriot",
        "nombre": "LORIOT"
    },
    {
        "id": "louroeelectronics",
        "nombre": "LOUROE ELECTRONICS"
    },
    {
        "id": "lowrance",
        "nombre": "LOWRANCE"
    },
    {
        "id": "lumitec",
        "nombre": "LUMITEC"
    },
    {
        "id": "lutroncasetawireless",
        "nombre": "LUTRON CASETA WIRELESS"
    },
    {
        "id": "lutronelectronics",
        "nombre": "LUTRON ELECTRONICS"
    },
    {
        "id": "lutronmaestro",
        "nombre": "LUTRON MAESTRO"
    },
    {
        "id": "lutronradiora3",
        "nombre": "LUTRON RADIORA 3"
    },
    {
        "id": "m",
        "nombre": "M"
    },
    {
        "id": "m2mservices",
        "nombre": "M2M SERVICES"
    },
    {
        "id": "macurcoaerionics",
        "nombre": "MACURCO - AERIONICS"
    },
    {
        "id": "maglocksinc",
        "nombre": "Mag Locks, Inc."
    },
    {
        "id": "maglite",
        "nombre": "MAGLITE"
    },
    {
        "id": "makita",
        "nombre": "MAKITA"
    },
    {
        "id": "mancilla",
        "nombre": "MANCILLA"
    },
    {
        "id": "mastertrack",
        "nombre": "MASTERTRACK"
    },
    {
        "id": "maxon",
        "nombre": "MAXON"
    },
    {
        "id": "mcdisecurityproductsinc",
        "nombre": "MCDI SECURITY PRODUCTS INC"
    },
    {
        "id": "meanwell",
        "nombre": "MEANWELL"
    },
    {
        "id": "mechmind",
        "nombre": "MECH MIND"
    },
    {
        "id": "medecoassaabloy",
        "nombre": "MEDECO - ASSA ABLOY"
    },
    {
        "id": "meitrack",
        "nombre": "MEITRACK"
    },
    {
        "id": "mercusys",
        "nombre": "Mercusys"
    },
    {
        "id": "merik",
        "nombre": "MERIK"
    },
    {
        "id": "metalicosnevarez",
        "nombre": "Metalicos nevarez"
    },
    {
        "id": "mfj",
        "nombre": "MFJ"
    },
    {
        "id": "microcom",
        "nombre": "MICROCOM"
    },
    {
        "id": "microlab",
        "nombre": "MICROLAB"
    },
    {
        "id": "microsoftcorporation",
        "nombre": "MICROSOFT CORPORATION"
    },
    {
        "id": "midea",
        "nombre": "MIDEA"
    },
    {
        "id": "midian",
        "nombre": "MIDIAN"
    },
    {
        "id": "midland",
        "nombre": "MIDLAND"
    },
    {
        "id": "mikrotik",
        "nombre": "MIKROTIK"
    },
    {
        "id": "milesight",
        "nombre": "MILESIGHT"
    },
    {
        "id": "milestonesystemsinc",
        "nombre": "MILESTONE SYSTEMS INC."
    },
    {
        "id": "milwaukee",
        "nombre": "MILWAUKEE"
    },
    {
        "id": "mimosanetworks",
        "nombre": "MIMOSA NETWORKS"
    },
    {
        "id": "minicircuits",
        "nombre": "MINI CIRCUITS"
    },
    {
        "id": "mitsubishi",
        "nombre": "MITSUBISHI"
    },
    {
        "id": "mobileye",
        "nombre": "MOBILEYE"
    },
    {
        "id": "mokosmart",
        "nombre": "MOKOSMART"
    },
    {
        "id": "momento",
        "nombre": "MOMENTO"
    },
    {
        "id": "morad",
        "nombre": "MORAD"
    },
    {
        "id": "morningstar",
        "nombre": "MORNINGSTAR"
    },
    {
        "id": "mouserelectronics",
        "nombre": "MOUSER ELECTRONICS"
    },
    {
        "id": "mtiwirelessedge",
        "nombre": "MTI WIRELESS EDGE"
    },
    {
        "id": "must",
        "nombre": "MUST"
    },
    {
        "id": "nanfone",
        "nombre": "NANFONE"
    },
    {
        "id": "nationalwirecable",
        "nombre": "NATIONAL WIRE & CABLE"
    },
    {
        "id": "navicoinc",
        "nombre": "NAVICO INC"
    },
    {
        "id": "navionics",
        "nombre": "NAVIONICS"
    },
    {
        "id": "nbepcom",
        "nombre": "NB-EPCOM"
    },
    {
        "id": "nedap",
        "nombre": "NEDAP"
    },
    {
        "id": "nep",
        "nombre": "NEP"
    },
    {
        "id": "netgear",
        "nombre": "NETGEAR"
    },
    {
        "id": "netonix",
        "nombre": "NETONIX"
    },
    {
        "id": "netpoint",
        "nombre": "NetPoint"
    },
    {
        "id": "neurallabs",
        "nombre": "Neural Labs"
    },
    {
        "id": "newark",
        "nombre": "NEWARK"
    },
    {
        "id": "newmar",
        "nombre": "NEWMAR"
    },
    {
        "id": "nexetalk",
        "nombre": "NEXETALK"
    },
    {
        "id": "nfpa",
        "nombre": "NFPA"
    },
    {
        "id": "nice",
        "nombre": "NICE"
    },
    {
        "id": "nike",
        "nombre": "NIKE"
    },
    {
        "id": "notifier",
        "nombre": "NOTIFIER"
    },
    {
        "id": "novastar",
        "nombre": "NOVASTAR"
    },
    {
        "id": "novitgps",
        "nombre": "NOVIT GPS"
    },
    {
        "id": "nuctech",
        "nombre": "NUCTECH"
    },
    {
        "id": "null",
        "nombre": "null"
    },
    {
        "id": "nuuo",
        "nombre": "NUUO"
    },
    {
        "id": "nxradio",
        "nombre": "NXRADIO"
    },
    {
        "id": "nyne",
        "nombre": "NYNE"
    },
    {
        "id": "oem",
        "nombre": "OEM"
    },
    {
        "id": "oncamgrandeye",
        "nombre": "ONCAM GRANDEYE"
    },
    {
        "id": "opendeskpro",
        "nombre": "OPEN DESK PRO"
    },
    {
        "id": "openalpr",
        "nombre": "OpenALPR"
    },
    {
        "id": "openvox",
        "nombre": "OpenVox"
    },
    {
        "id": "optex",
        "nombre": "OPTEX"
    },
    {
        "id": "optoelectronics",
        "nombre": "OPTOELECTRONICS"
    },
    {
        "id": "orbtech",
        "nombre": "ORBTECH"
    },
    {
        "id": "osidbyxtralis",
        "nombre": "OSID BY XTRALIS"
    },
    {
        "id": "ossi",
        "nombre": "OSSI"
    },
    {
        "id": "oster",
        "nombre": "OSTER"
    },
    {
        "id": "otto",
        "nombre": "OTTO"
    },
    {
        "id": "panasonic",
        "nombre": "PANASONIC"
    },
    {
        "id": "panavise",
        "nombre": "PANAVISE"
    },
    {
        "id": "panduit",
        "nombre": "PANDUIT"
    },
    {
        "id": "panoramaantennas",
        "nombre": "PANORAMA ANTENNAS"
    },
    {
        "id": "paradox",
        "nombre": "PARADOX"
    },
    {
        "id": "parkinglogix",
        "nombre": "PARKING LOGIX"
    },
    {
        "id": "pcsc",
        "nombre": "PCSC"
    },
    {
        "id": "pctel",
        "nombre": "PCTEL"
    },
    {
        "id": "peerlees",
        "nombre": "PEERLEES"
    },
    {
        "id": "peerless",
        "nombre": "PEERLESS"
    },
    {
        "id": "perko",
        "nombre": "PERKO"
    },
    {
        "id": "phaethon",
        "nombre": "PHAETHON"
    },
    {
        "id": "phillipsassaabloy",
        "nombre": "PHILLIPS-ASSA ABLOY"
    },
    {
        "id": "phox",
        "nombre": "PHOX"
    },
    {
        "id": "pima",
        "nombre": "PIMA"
    },
    {
        "id": "planet",
        "nombre": "PLANET"
    },
    {
        "id": "planetnetworkingandcommunication",
        "nombre": "PLANET NETWORKING AND COMMUNICATION"
    },
    {
        "id": "plp",
        "nombre": "PLP"
    },
    {
        "id": "politec",
        "nombre": "Politec"
    },
    {
        "id": "polk",
        "nombre": "POLK"
    },
    {
        "id": "polybrite",
        "nombre": "POLYBRITE"
    },
    {
        "id": "polyphaser",
        "nombre": "POLYPHASER"
    },
    {
        "id": "polysensetechnologies",
        "nombre": "POLYSENSE TECHNOLOGIES"
    },
    {
        "id": "positivecharge",
        "nombre": "POSITIVE CHARGE"
    },
    {
        "id": "potter",
        "nombre": "POTTER"
    },
    {
        "id": "powerproducts",
        "nombre": "POWER PRODUCTS"
    },
    {
        "id": "powersonic",
        "nombre": "POWER SONIC"
    },
    {
        "id": "powermate",
        "nombre": "POWERMATE"
    },
    {
        "id": "precision",
        "nombre": "PRECISION"
    },
    {
        "id": "precisionvideo",
        "nombre": "PRECISION VIDEO"
    },
    {
        "id": "primuswindpower",
        "nombre": "PRIMUSWINDPOWER"
    },
    {
        "id": "prostar",
        "nombre": "PROSTAR"
    },
    {
        "id": "protect",
        "nombre": "PROTECT"
    },
    {
        "id": "pryme",
        "nombre": "PRYME"
    },
    {
        "id": "pubangsensor",
        "nombre": "PUBANG-SENSOR"
    },
    {
        "id": "pullingenergy",
        "nombre": "PULLING ENERGY"
    },
    {
        "id": "pulse",
        "nombre": "PULSE"
    },
    {
        "id": "pulselarsenantennas",
        "nombre": "PULSE LARSEN ANTENNAS"
    },
    {
        "id": "pyronix",
        "nombre": "PYRONIX"
    },
    {
        "id": "pytes",
        "nombre": "PYTES"
    },
    {
        "id": "qlight",
        "nombre": "QLIGHT"
    },
    {
        "id": "qolsys",
        "nombre": "QOLSYS"
    },
    {
        "id": "rackstuds",
        "nombre": "rackstuds"
    },
    {
        "id": "raco",
        "nombre": "RACO"
    },
    {
        "id": "radiowaves",
        "nombre": "RADIOWAVES"
    },
    {
        "id": "rainbow",
        "nombre": "RAINBOW"
    },
    {
        "id": "rakwireless",
        "nombre": "RAKWIRELESS"
    },
    {
        "id": "ramsey",
        "nombre": "RAMSEY"
    },
    {
        "id": "rangersecuritydetectors",
        "nombre": "RANGER SECURITY DETECTORS"
    },
    {
        "id": "rasilient",
        "nombre": "Rasilient"
    },
    {
        "id": "raspberrypi",
        "nombre": "RASPBERRY PI"
    },
    {
        "id": "rawelt",
        "nombre": "RAWELT"
    },
    {
        "id": "raynorworldwide",
        "nombre": "RAYNOR WORLDWIDE"
    },
    {
        "id": "raytheon",
        "nombre": "RAYTHEON"
    },
    {
        "id": "razveri",
        "nombre": "RAZVERI"
    },
    {
        "id": "rbtec",
        "nombre": "RBTEC"
    },
    {
        "id": "rcidormakaba",
        "nombre": "RCI - DORMAKABA"
    },
    {
        "id": "redgps",
        "nombre": "REDGPS"
    },
    {
        "id": "renesas",
        "nombre": "RENESAS"
    },
    {
        "id": "retekess",
        "nombre": "RETEKESS"
    },
    {
        "id": "revo",
        "nombre": "REVO"
    },
    {
        "id": "reyee",
        "nombre": "REYEE"
    },
    {
        "id": "rfarmor",
        "nombre": "RF Armor"
    },
    {
        "id": "rfelements",
        "nombre": "RF ELEMENTS"
    },
    {
        "id": "rfindustries",
        "nombre": "RF INDUSTRIES"
    },
    {
        "id": "rfindustriesltd",
        "nombre": "RF INDUSTRIES,LTD"
    },
    {
        "id": "rfparts",
        "nombre": "RF PARTS"
    },
    {
        "id": "rfs",
        "nombre": "RFS"
    },
    {
        "id": "ridgid",
        "nombre": "RIDGID"
    },
    {
        "id": "risco",
        "nombre": "RISCO"
    },
    {
        "id": "risen",
        "nombre": "RISEN"
    },
    {
        "id": "ritar",
        "nombre": "RITAR"
    },
    {
        "id": "ritchie",
        "nombre": "RITCHIE"
    },
    {
        "id": "ritron",
        "nombre": "RITRON"
    },
    {
        "id": "rockonet",
        "nombre": "ROCKONET"
    },
    {
        "id": "rohn",
        "nombre": "ROHN"
    },
    {
        "id": "rokonet",
        "nombre": "ROKONET"
    },
    {
        "id": "rongta",
        "nombre": "RONGTA"
    },
    {
        "id": "rossi",
        "nombre": "ROSSI"
    },
    {
        "id": "rosslare",
        "nombre": "ROSSLARE"
    },
    {
        "id": "rosslaresecurityproducts",
        "nombre": "ROSSLARE SECURITY PRODUCTS"
    },
    {
        "id": "ruggear",
        "nombre": "RUGGEAR"
    },
    {
        "id": "ruijie",
        "nombre": "RUIJIE"
    },
    {
        "id": "ruizelectronics",
        "nombre": "Ruiz Electronics"
    },
    {
        "id": "rule",
        "nombre": "RULE"
    },
    {
        "id": "ruptela",
        "nombre": "RUPTELA"
    },
    {
        "id": "safefiredetectioninc",
        "nombre": "SAFE FIRE DETECTION INC."
    },
    {
        "id": "safesignal",
        "nombre": "SAFE SIGNAL"
    },
    {
        "id": "sailor",
        "nombre": "SAILOR"
    },
    {
        "id": "samlex",
        "nombre": "SAMLEX"
    },
    {
        "id": "samlexamerica",
        "nombre": "SAMLEX AMERICA"
    },
    {
        "id": "samsung",
        "nombre": "SAMSUNG"
    },
    {
        "id": "samsungelectronics",
        "nombre": "SAMSUNG ELECTRONICS"
    },
    {
        "id": "sanddisk",
        "nombre": "SAND DISK"
    },
    {
        "id": "sandisk",
        "nombre": "SANDISK"
    },
    {
        "id": "sanyo",
        "nombre": "SANYO"
    },
    {
        "id": "satlabgeosolutionhklimited",
        "nombre": "SATLAB GEOSOLUTION (HK) LIMITED"
    },
    {
        "id": "savox",
        "nombre": "SAVOX"
    },
    {
        "id": "schmalz",
        "nombre": "SCHMALZ"
    },
    {
        "id": "sdi",
        "nombre": "SDI"
    },
    {
        "id": "seaflo",
        "nombre": "SEAFLO"
    },
    {
        "id": "seagate",
        "nombre": "SEAGATE"
    },
    {
        "id": "sebury",
        "nombre": "SEBURY"
    },
    {
        "id": "secolarm",
        "nombre": "SECO LARM"
    },
    {
        "id": "secolarmusainc",
        "nombre": "SECO-LARM USA INC"
    },
    {
        "id": "secullum",
        "nombre": "SECULLUM"
    },
    {
        "id": "securewireless",
        "nombre": "SECURE WIRELESS"
    },
    {
        "id": "securitronassaabloy",
        "nombre": "SECURITRON-ASSA ABLOY"
    },
    {
        "id": "security",
        "nombre": "SECURITY"
    },
    {
        "id": "seetronic",
        "nombre": "SEETRONIC"
    },
    {
        "id": "seleccioneunaopcin",
        "nombre": "Seleccione una opción"
    },
    {
        "id": "selectone",
        "nombre": "SELECTONE"
    },
    {
        "id": "sensear",
        "nombre": "SENSEAR"
    },
    {
        "id": "servision",
        "nombre": "SERVISION"
    },
    {
        "id": "sfire",
        "nombre": "SFIRE"
    },
    {
        "id": "sgc",
        "nombre": "SGC"
    },
    {
        "id": "shakespeare",
        "nombre": "SHAKESPEARE"
    },
    {
        "id": "shelly",
        "nombre": "SHELLY"
    },
    {
        "id": "shengda",
        "nombre": "SHENGDA"
    },
    {
        "id": "shinestage",
        "nombre": "SHINESTAGE"
    },
    {
        "id": "shurflo",
        "nombre": "SHURFLO"
    },
    {
        "id": "siemens",
        "nombre": "SIEMENS"
    },
    {
        "id": "siemon",
        "nombre": "SIEMON"
    },
    {
        "id": "signalinside",
        "nombre": "SIGNAL INSIDE"
    },
    {
        "id": "signalpro",
        "nombre": "SIGNALPRO"
    },
    {
        "id": "siklu",
        "nombre": "Siklu"
    },
    {
        "id": "silentkightbyhoneywell",
        "nombre": "SILENT KIGHT BY HONEYWELL"
    },
    {
        "id": "silentknightbyhoneywell",
        "nombre": "SILENT KNIGHT BY HONEYWELL"
    },
    {
        "id": "silimex",
        "nombre": "SILIMEX"
    },
    {
        "id": "simon",
        "nombre": "SIMON"
    },
    {
        "id": "simrad",
        "nombre": "SIMRAD"
    },
    {
        "id": "sinclair",
        "nombre": "SINCLAIR"
    },
    {
        "id": "siqura",
        "nombre": "SIQURA"
    },
    {
        "id": "skb",
        "nombre": "SKB"
    },
    {
        "id": "skylink",
        "nombre": "SKYLINK"
    },
    {
        "id": "skypatrol",
        "nombre": "SKYPATROL"
    },
    {
        "id": "skyworth",
        "nombre": "SKYWORTH"
    },
    {
        "id": "smarthomebyepcom",
        "nombre": "SMARTHOME BY EPCOM"
    },
    {
        "id": "smartrunk",
        "nombre": "SMARTRUNK"
    },
    {
        "id": "smc",
        "nombre": "SMC"
    },
    {
        "id": "smokecloak",
        "nombre": "SMOKE CLOAK"
    },
    {
        "id": "solark",
        "nombre": "SOL-ARK"
    },
    {
        "id": "solaria",
        "nombre": "SOLARIA"
    },
    {
        "id": "solarjack",
        "nombre": "SOLARJACK"
    },
    {
        "id": "solarworld",
        "nombre": "SOLARWORLD"
    },
    {
        "id": "solisto",
        "nombre": "SOLISTO"
    },
    {
        "id": "somfy",
        "nombre": "SOMFY"
    },
    {
        "id": "sonoff",
        "nombre": "SONOFF"
    },
    {
        "id": "sony",
        "nombre": "SONY"
    },
    {
        "id": "southwire",
        "nombre": "SOUTHWIRE"
    },
    {
        "id": "stancil",
        "nombre": "STANCIL"
    },
    {
        "id": "stanley",
        "nombre": "STANLEY"
    },
    {
        "id": "stanleysupplyservices",
        "nombre": "STANLEY SUPPLY & SERVICES"
    },
    {
        "id": "startechcom",
        "nombre": "STARTECH COM,"
    },
    {
        "id": "steca",
        "nombre": "STECA"
    },
    {
        "id": "sti",
        "nombre": "STI"
    },
    {
        "id": "streamax",
        "nombre": "STREAMAX"
    },
    {
        "id": "streamaxtech",
        "nombre": "STREAMAX TECH"
    },
    {
        "id": "streetsmartsecurityinchoneywe",
        "nombre": "STREET SMART SECURITY,INC.,(HONEYWE"
    },
    {
        "id": "sunamp",
        "nombre": "SUN AMP"
    },
    {
        "id": "sundanzer",
        "nombre": "SUN DANZER"
    },
    {
        "id": "sunpumps",
        "nombre": "SUN PUMPS"
    },
    {
        "id": "sunpums",
        "nombre": "SUN PUMS"
    },
    {
        "id": "sunearth",
        "nombre": "Sun-Earth"
    },
    {
        "id": "sunell",
        "nombre": "Sunell"
    },
    {
        "id": "sunforce",
        "nombre": "SUNFORCE"
    },
    {
        "id": "sunmi",
        "nombre": "SUNMI"
    },
    {
        "id": "sunpower",
        "nombre": "SUNPOWER"
    },
    {
        "id": "suntree",
        "nombre": "SUNTREE"
    },
    {
        "id": "superwind",
        "nombre": "SUPERWIND"
    },
    {
        "id": "suprema",
        "nombre": "SUPREMA"
    },
    {
        "id": "surefi",
        "nombre": "Sure-Fi"
    },
    {
        "id": "surtek",
        "nombre": "SURTEK"
    },
    {
        "id": "surveon",
        "nombre": "SURVEON"
    },
    {
        "id": "swissgear",
        "nombre": "SWISS GEAR"
    },
    {
        "id": "switchbot",
        "nombre": "SWITCHBOT"
    },
    {
        "id": "synology",
        "nombre": "SYNOLOGY"
    },
    {
        "id": "sys",
        "nombre": "SYS"
    },
    {
        "id": "syscomparts",
        "nombre": "SYSCOM PARTS"
    },
    {
        "id": "syscomtowers",
        "nombre": "SYSCOM TOWERS"
    },
    {
        "id": "syscomvideo",
        "nombre": "SYSCOM VIDEO"
    },
    {
        "id": "syscomvideoturbohd",
        "nombre": "SYSCOM VIDEO TURBO HD,"
    },
    {
        "id": "systemsensor",
        "nombre": "SYSTEM SENSOR"
    },
    {
        "id": "ti",
        "nombre": "T.I."
    },
    {
        "id": "tait",
        "nombre": "TAIT"
    },
    {
        "id": "takex",
        "nombre": "TAKEX"
    },
    {
        "id": "tamron",
        "nombre": "TAMRON"
    },
    {
        "id": "tane",
        "nombre": "TANE"
    },
    {
        "id": "tao",
        "nombre": "TAO"
    },
    {
        "id": "tassta",
        "nombre": "TASSTA"
    },
    {
        "id": "teac",
        "nombre": "TEAC"
    },
    {
        "id": "technitool",
        "nombre": "TECHNITOOL"
    },
    {
        "id": "tecnovideo",
        "nombre": "TECNOVIDEO"
    },
    {
        "id": "tefal",
        "nombre": "TEFAL"
    },
    {
        "id": "telecomsecurity",
        "nombre": "TELECOM SECURITY"
    },
    {
        "id": "telectronics",
        "nombre": "TELECTRONICS"
    },
    {
        "id": "teletronics",
        "nombre": "TELETRONICS"
    },
    {
        "id": "teletronicsinternational",
        "nombre": "TELETRONICS  INTERNATIONAL"
    },
    {
        "id": "telewave",
        "nombre": "TELEWAVE"
    },
    {
        "id": "telewaveinc",
        "nombre": "TELEWAVE INC"
    },
    {
        "id": "telex",
        "nombre": "TELEX"
    },
    {
        "id": "telosystems",
        "nombre": "Telo Systems"
    },
    {
        "id": "teltonika",
        "nombre": "Teltonika"
    },
    {
        "id": "teltonikaenergy",
        "nombre": "TELTONIKA ENERGY"
    },
    {
        "id": "teltronic",
        "nombre": "TELTRONIC"
    },
    {
        "id": "tempo",
        "nombre": "TEMPO"
    },
    {
        "id": "tenma",
        "nombre": "TENMA"
    },
    {
        "id": "tesaassaabloy",
        "nombre": "TESA - ASSA ABLOY"
    },
    {
        "id": "testa",
        "nombre": "testa"
    },
    {
        "id": "tew",
        "nombre": "TEW"
    },
    {
        "id": "texasinstrument",
        "nombre": "TEXAS INSTRUMENT"
    },
    {
        "id": "thehomedepot",
        "nombre": "THE HOME DEPOT"
    },
    {
        "id": "thesiemon",
        "nombre": "THE SIEMON"
    },
    {
        "id": "thesiemoncompany",
        "nombre": "THE SIEMON COMPANY"
    },
    {
        "id": "thorsman",
        "nombre": "THORSMAN"
    },
    {
        "id": "thorsmex",
        "nombre": "THORSMEX"
    },
    {
        "id": "timesmicrowave",
        "nombre": "Times Microwave"
    },
    {
        "id": "titanautomation",
        "nombre": "TITAN-AUTOMATION"
    },
    {
        "id": "titaniuminnovations",
        "nombre": "TITANIUM INNOVATIONS"
    },
    {
        "id": "topflytech",
        "nombre": "TopFlyTech"
    },
    {
        "id": "toshiba",
        "nombre": "TOSHIBA"
    },
    {
        "id": "totalground",
        "nombre": "TOTAL GROUND"
    },
    {
        "id": "tplink",
        "nombre": "TP-LINK"
    },
    {
        "id": "tplcommunications",
        "nombre": "TPL COMMUNICATIONS"
    },
    {
        "id": "trafficlogix",
        "nombre": "TRAFFIC LOGIX"
    },
    {
        "id": "tram",
        "nombre": "TRAM"
    },
    {
        "id": "trambrowning",
        "nombre": "TRAM BROWNING"
    },
    {
        "id": "tramontina",
        "nombre": "TRAMONTINA"
    },
    {
        "id": "transcend",
        "nombre": "TRANSCEND"
    },
    {
        "id": "transcrypt",
        "nombre": "TRANSCRYPT"
    },
    {
        "id": "transtector",
        "nombre": "TRANSTECTOR"
    },
    {
        "id": "trendnet",
        "nombre": "TRENDNET"
    },
    {
        "id": "tridentmicrosystems",
        "nombre": "TRIDENT MICRO SYSTEMS"
    },
    {
        "id": "trinasolar",
        "nombre": "Trina Solar"
    },
    {
        "id": "trine",
        "nombre": "TRINE"
    },
    {
        "id": "triumph",
        "nombre": "TRIUMPH"
    },
    {
        "id": "truaudio",
        "nombre": "TRUAUDIO"
    },
    {
        "id": "trylon",
        "nombre": "Trylon"
    },
    {
        "id": "tuftug",
        "nombre": "TUF TUG"
    },
    {
        "id": "tulmex",
        "nombre": "TULMEX"
    },
    {
        "id": "turbohd",
        "nombre": "TURBOHD"
    },
    {
        "id": "twr",
        "nombre": "TWR"
    },
    {
        "id": "txpro",
        "nombre": "TX PRO"
    },
    {
        "id": "txrxsystemsinc",
        "nombre": "TX RX SYSTEMS INC."
    },
    {
        "id": "txpromarine",
        "nombre": "TXPROMARINE"
    },
    {
        "id": "tyconpowerproducts",
        "nombre": "TYCON POWER PRODUCTS"
    },
    {
        "id": "tysonic",
        "nombre": "TYSONIC"
    },
    {
        "id": "ubiquiti",
        "nombre": "UBIQUITI"
    },
    {
        "id": "ubiquitiinc",
        "nombre": "Ubiquiti Inc"
    },
    {
        "id": "ubiquitinetworks",
        "nombre": "UBIQUITI NETWORKS"
    },
    {
        "id": "ugreen",
        "nombre": "UGREEN"
    },
    {
        "id": "ulirvision",
        "nombre": "ULIRVISION"
    },
    {
        "id": "unit",
        "nombre": "UNI-T"
    },
    {
        "id": "uniden",
        "nombre": "UNIDEN"
    },
    {
        "id": "unitedparts",
        "nombre": "UNITED PARTS"
    },
    {
        "id": "unitree",
        "nombre": "UNITREE"
    },
    {
        "id": "universal",
        "nombre": "UNIVERSAL"
    },
    {
        "id": "urfog",
        "nombre": "UR FOG"
    },
    {
        "id": "urrea",
        "nombre": "URREA"
    },
    {
        "id": "usfull",
        "nombre": "USFULL"
    },
    {
        "id": "usrobotics",
        "nombre": "USRobotics"
    },
    {
        "id": "v",
        "nombre": "v"
    },
    {
        "id": "vsol",
        "nombre": "V-SOL"
    },
    {
        "id": "varios",
        "nombre": "VARIOS"
    },
    {
        "id": "vdegroup",
        "nombre": "VDE GROUP"
    },
    {
        "id": "veea",
        "nombre": "VEEA"
    },
    {
        "id": "vertexstandard",
        "nombre": "VERTEX STANDARD"
    },
    {
        "id": "vertiv",
        "nombre": "VERTIV"
    },
    {
        "id": "viakon",
        "nombre": "VIAKON"
    },
    {
        "id": "viavi",
        "nombre": "VIAVI"
    },
    {
        "id": "victorinox",
        "nombre": "VICTORINOX"
    },
    {
        "id": "victronenergy",
        "nombre": "VICTRON ENERGY"
    },
    {
        "id": "videocomm",
        "nombre": "VIDEOCOMM"
    },
    {
        "id": "videolarm",
        "nombre": "VIDEOLARM"
    },
    {
        "id": "videotec",
        "nombre": "VIDEOTEC"
    },
    {
        "id": "videotel",
        "nombre": "VIDEOTEL"
    },
    {
        "id": "viewsonic",
        "nombre": "VIEWSONIC"
    },
    {
        "id": "viking",
        "nombre": "VIKING"
    },
    {
        "id": "vireo",
        "nombre": "VIREO"
    },
    {
        "id": "vision",
        "nombre": "VISION"
    },
    {
        "id": "vitek",
        "nombre": "vitek"
    },
    {
        "id": "vssl",
        "nombre": "VSSL"
    },
    {
        "id": "ww",
        "nombre": "W&W"
    },
    {
        "id": "wacom",
        "nombre": "WACOM"
    },
    {
        "id": "wago",
        "nombre": "WAGO"
    },
    {
        "id": "wavionwireless",
        "nombre": "WAVION WIRELESS"
    },
    {
        "id": "wd",
        "nombre": "WD"
    },
    {
        "id": "weboostwilsonelectronics",
        "nombre": "WEBOOST / WILSON ELECTRONICS"
    },
    {
        "id": "weller",
        "nombre": "WELLER"
    },
    {
        "id": "westerndigitalwd",
        "nombre": "Western Digital (WD)"
    },
    {
        "id": "witek",
        "nombre": "WI-TEK"
    },
    {
        "id": "wilmoreelectronics",
        "nombre": "WILMORE ELECTRONICS"
    },
    {
        "id": "wilson",
        "nombre": "WILSON"
    },
    {
        "id": "wilsonpro",
        "nombre": "WILSONPRO"
    },
    {
        "id": "wilsonproweboost",
        "nombre": "WilsonPRO / weBoost"
    },
    {
        "id": "winland",
        "nombre": "WINLAND"
    },
    {
        "id": "winlandelectronics",
        "nombre": "WINLAND ELECTRONICS"
    },
    {
        "id": "winsted",
        "nombre": "Winsted"
    },
    {
        "id": "wpt",
        "nombre": "WPT"
    },
    {
        "id": "x",
        "nombre": "X"
    },
    {
        "id": "x10",
        "nombre": "X10"
    },
    {
        "id": "xtralis",
        "nombre": "XTRALIS"
    },
    {
        "id": "yaesu",
        "nombre": "YAESU"
    },
    {
        "id": "yaleassaabloy",
        "nombre": "YALE-ASSA ABLOY"
    },
    {
        "id": "yamaha",
        "nombre": "YAMAHA"
    },
    {
        "id": "yealink",
        "nombre": "YEALINK"
    },
    {
        "id": "yeastar",
        "nombre": "YEASTAR"
    },
    {
        "id": "yingli",
        "nombre": "YINGLI"
    },
    {
        "id": "yobi",
        "nombre": "YOBI"
    },
    {
        "id": "yonusa",
        "nombre": "YONUSA"
    },
    {
        "id": "yw",
        "nombre": "YW"
    },
    {
        "id": "zavio",
        "nombre": "ZAVIO"
    },
    {
        "id": "zetron",
        "nombre": "ZETRON"
    },
    {
        "id": "zkong",
        "nombre": "ZKONG"
    },
    {
        "id": "zkt",
        "nombre": "ZKT"
    },
    {
        "id": "zkteco",
        "nombre": "ZKTECO"
    },
    {
        "id": "zktecoaccesspro",
        "nombre": "ZKTECO - AccessPRO"
    },
    {
        "id": "zktecogreenlabel",
        "nombre": "ZKTECO - GREEN LABEL"
    },
    {
        "id": "zomeworks",
        "nombre": "ZOMEWORKS"
    }
]
Api marca por id
https://developers.syscom.mx/api/v1/marcas/hikvision
resultado 
{
    "descripcion": "Hikvision es el principal proveedor mundial de productos y soluciones innovadoras de videovigilancia.\n\nFundada en 2001, Hikvision cuenta con más de 26.000 empleados, de los cuales 13.000 son ingenieros en I+D . La empresa invierte anualmente entre el 7-8% de su facturación anual en investigación y desarrollo para la innovación continua de sus productos. Hikvision ha establecido un sistema de investigación y desarrollo completo y en niveles múltiples que incluye todas las operaciones: investigación, diseño, desarrollo, pruebas, soporte técnico y servicio. Desde su sede en Hangzhou, los equipos de I+D operan a nivel mundial, incluyendo centros de I+D en Montreal en Canadá, Silicon Valley en EE.UU., Liverpool en Reino Unido, Beijing, Shanghai, Chongqing y Wuhan en China.\n\nLa gran variedad de productos de Hikvision incluyen DVRs, NVRs, HVRs,MVRs, Camaras Analogicas e IP de alta definición, Control de Acceso, Alarmas, Intercom, Intelligent Storage, Display, etc.",
    "titulo": "HIKVISION Digital Technology Co., Ltd. is",
    "logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
    "categorias": [
        {
            "nombre": "Área Eléctrica",
            "id": "66434",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/HIKACCORD/HIKACCORD-p.PNG",
            "cantidad": 1
        },
        {
            "nombre": "Acceso Vehicular",
            "id": "499",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSTSC30044H/portada_0S400.PNG",
            "cantidad": 98
        },
        {
            "nombre": "Acceso SIN CONTACTO",
            "id": "66244",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSK1T681DBWX/DSK1T681DBWX-p.PNG",
            "cantidad": 26
        },
        {
            "nombre": "Accesorios",
            "id": "377",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSPS1EWB_B/DSPS1EWB_B-p.PNG",
            "cantidad": 16
        },
        {
            "nombre": "Accesorios",
            "id": "415",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSKAB671B/DSKAB671B-p.PNG",
            "cantidad": 16
        },
        {
            "nombre": "Accesorios Generales",
            "id": "218",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/DS1005KI/DS1005KI.jpg",
            "cantidad": 333
        },
        {
            "nombre": "Almacenamiento",
            "id": "66672",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/WUS721010ALE6L4_HIK/WUS721010ALE6L4_HIK-p.PNG",
            "cantidad": 5
        },
        {
            "nombre": "Audio IP",
            "id": "66524",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSQAZ1A1000G1VB4/portada_0S400.PNG",
            "cantidad": 11
        },
        {
            "nombre": "Audio Profesional",
            "id": "66525",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/imagen_no_disponible.jpg",
            "cantidad": 1
        },
        {
            "nombre": "Audio residencial/Comercial",
            "id": "66526",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSQAE0A240G1VB6/110/portada_0S400.PNG",
            "cantidad": 14
        },
        {
            "nombre": "Automatización - Casa Inteligente",
            "id": "523",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSPDPC12PEG2WB/DSPDPC12PEG2WB-p.PNG",
            "cantidad": 2
        },
        {
            "nombre": "Baterías y Cargadores",
            "id": "66404",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSPABATTERY/DSPABATTERY-p.PNG",
            "cantidad": 1
        },
        {
            "nombre": "Biométricos",
            "id": "429",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSTMC407EH/portada_0S400.PNG",
            "cantidad": 77
        },
        {
            "nombre": "Cámaras IP y NVRs",
            "id": "214",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/DS9664NII16/DS9664NII16.jpg",
            "cantidad": 728
        },
        {
            "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
            "id": "476",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/DS7308HGHISH/DS7308HGHISH.jpg",
            "cantidad": 156
        },
        {
            "nombre": "Cable",
            "id": "65812",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS1LN6UEW/DS1LN6UEW-p.PNG",
            "cantidad": 14
        },
        {
            "nombre": "Cableado de Cobre",
            "id": "65813",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS1FPA2A/portada_0S400.PNG",
            "cantidad": 13
        },
        {
            "nombre": "Cables",
            "id": "365",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS1AC4AUC0M/DS1AC4AUC0M-p.PNG",
            "cantidad": 1
        },
        {
            "nombre": "Cables y Conectores",
            "id": "206",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS1LN6UEW/DS1LN6UEW-p.PNG",
            "cantidad": 20
        },
        {
            "nombre": "Cercas Eléctricas",
            "id": "375",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSPWA48KSYSNGV2/DSPWA48KSYSNGV2-p.PNG",
            "cantidad": 2
        },
        {
            "nombre": "Cerraduras",
            "id": "417",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSKLM2812/portada_0S400.PNG",
            "cantidad": 8
        },
        {
            "nombre": "Charola",
            "id": "65843",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSXSPB04S/B/portada_0S400.PNG",
            "cantidad": 2
        },
        {
            "nombre": "Conectividad y Cables",
            "id": "66680",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/HSHUBCBC2L/HSHUBCBC2L-p.PNG",
            "cantidad": 2
        },
        {
            "nombre": "Conectores ",
            "id": "65915",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS1M6UA30U/DS1M6UA30U-p.PNG",
            "cantidad": 4
        },
        {
            "nombre": "Contactos Magnéticos ",
            "id": "370",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSPDMCXEWB/DSPDMCXEWB-p.PNG",
            "cantidad": 8
        },
        {
            "nombre": "Control de Rondas Para Vigilantes",
            "id": "422",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSPWA48KSRONDIN/DSPWA48KSRONDIN-p.PNG",
            "cantidad": 2
        },
        {
            "nombre": "Detectores  / Sensores",
            "id": "372",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSTDSB0GFK_500M/DSTDSB0GFK_500M-p.PNG",
            "cantidad": 48
        },
        {
            "nombre": "Detectores Autónomos",
            "id": "448",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSPDSMK4BAR/DSPDSMK4BAR-p.PNG",
            "cantidad": 1
        },
        {
            "nombre": "Detectores de Metal",
            "id": "425",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/ISDSMW1701SC/ISDSMW1701SC-p.PNG",
            "cantidad": 8
        },
        {
            "nombre": "Dispositivos Convencionales",
            "id": "65852",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/JSAPHK1104/JSAPHK1104-p.PNG",
            "cantidad": 5
        },
        {
            "nombre": "Drones, Robots e Industrial",
            "id": "66369",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSQAAI264G1PG/DSQAAI264G1PG-p.PNG",
            "cantidad": 3
        },
        {
            "nombre": "Energía",
            "id": "208",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/LAS6057CNRJ45/LAS6057CNRJ45.jpg",
            "cantidad": 59
        },
        {
            "nombre": "Energía Solar",
            "id": "66409",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/AEMC10430.2/portada_0S400.PNG",
            "cantidad": 1
        },
        {
            "nombre": "Enlaces PtP y PtMP",
            "id": "65877",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS3WF025AC/D/portada_0S400.PNG",
            "cantidad": 6
        },
        {
            "nombre": "Equipo de Cómputo",
            "id": "66663",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSVP41DC_HW7/DSVP41DC_HW7-p.PNG",
            "cantidad": 12
        },
        {
            "nombre": "Fuentes de Alimentación",
            "id": "427",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSKAS7M01/DSKAS7M01-p.PNG",
            "cantidad": 1
        },
        {
            "nombre": "Fuentes de Poder",
            "id": "66442",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSDP320F15V/N/portada_0S400.PNG",
            "cantidad": 12
        },
        {
            "nombre": "Gabinetes y Cajas",
            "id": "66495",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSKLM2812/portada_0S400.PNG",
            "cantidad": 2
        },
        {
            "nombre": "Inspección por Rayos X y Explosivos",
            "id": "465",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/ISDSC100100DH4CVL/portada_0S400.PNG",
            "cantidad": 8
        },
        {
            "nombre": "Kits- Sistemas Completos",
            "id": "219",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2TXS262810P_QA_GLT_CH36S80(LA)/DS2TXS262810P_QA_GLT_CH36S80(LA)-p.PNG",
            "cantidad": 45
        },
        {
            "nombre": "Lectoras y Tarjetas",
            "id": "65945",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/kfranco/S70/S50det.jpg",
            "cantidad": 20
        },
        {
            "nombre": "Módulos de Expansión ",
            "id": "355",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSPM1I16O2WB/DSPM1I16O2WB-p.PNG",
            "cantidad": 11
        },
        {
            "nombre": "Megafonía y Audioevacuación",
            "id": "65862",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSQAZ1A1000G1VB4/portada_0S400.PNG",
            "cantidad": 18
        },
        {
            "nombre": "Monitores Pantallas y Mobiliario",
            "id": "65968",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSCW3X3LUY55/DSCW3X3LUY55-p.PNG",
            "cantidad": 97
        },
        {
            "nombre": "Networking",
            "id": "294",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/LAS6057CNRJ45/LAS6057CNRJ45.jpg",
            "cantidad": 76
        },
        {
            "nombre": "Paneles de Alarma",
            "id": "351",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSPWA48KSDV2(R)/DSPWA48KSDV2(R)-p.PNG",
            "cantidad": 23
        },
        {
            "nombre": "Paneles de Alarma y Accesorios Hikvision",
            "id": "66284",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSQFV5002_KIT/DSQFV5002_KIT-p.PNG",
            "cantidad": 192
        },
        {
            "nombre": "Paneles de Control de Acceso",
            "id": "424",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/KITUHFSTICKER02/KITUHFSTICKER02-p.PNG",
            "cantidad": 23
        },
        {
            "nombre": "Pantallas/Monitores",
            "id": "66530",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSD4215MI070H(B)/DSD4215MI070H(B)-p.PNG",
            "cantidad": 42
        },
        {
            "nombre": "Prevención de Incendio by Hikvision",
            "id": "66705",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2TD6267100C4L_WY/DS2TD6267100C4L_WY-p.PNG",
            "cantidad": 34
        },
        {
            "nombre": "Protección Perimetral ",
            "id": "387",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSTDSB0GFK_500M/DSTDSB0GFK_500M-p.PNG",
            "cantidad": 19
        },
        {
            "nombre": "Racks y Gabinetes",
            "id": "509",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSXS6618E/DG/portada_0S400.PNG",
            "cantidad": 5
        },
        {
            "nombre": "Racks y Gabinetes",
            "id": "65815",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSXS6618E/DG/portada_0S400.PNG",
            "cantidad": 7
        },
        {
            "nombre": "Redes WiFi",
            "id": "65879",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS3WG210GPSI/DS3WG210GPSI-p.PNG",
            "cantidad": 7
        },
        {
            "nombre": "Refacciones",
            "id": "65723",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSK3H4210LX120_PGDM60_WB_FIH/DSK3H4210LX120_PGDM60_WB_FIH-p.PNG",
            "cantidad": 112
        },
        {
            "nombre": "Respaldo de Energía",
            "id": "66447",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSUPS03K72R/TJS/X/portada_0S400.PNG",
            "cantidad": 6
        },
        {
            "nombre": "Reuniones Interactivas",
            "id": "66532",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSD5C98RB_B/DSD5C98RB_B-p.PNG",
            "cantidad": 24
        },
        {
            "nombre": "Servidores / Almacenamiento",
            "id": "65963",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/101502130/101502130.jpg",
            "cantidad": 78
        },
        {
            "nombre": "Software VMS y Analíticas",
            "id": "65982",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/IVMS4200/IVMS4200.jpg",
            "cantidad": 159
        },
        {
            "nombre": "Teclados",
            "id": "354",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSPK1EWB/DSPK1EWB-p.PNG",
            "cantidad": 3
        },
        {
            "nombre": "Teclados Autónomos",
            "id": "423",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSK1T502DBWXCQR/DSK1T502DBWXCQR-p.PNG",
            "cantidad": 7
        },
        {
            "nombre": "Torniquetes y Puertas de Cortesía",
            "id": "66061",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSK3H4420120_PGDM60/DSK3H4420120_PGDM60-p.PNG",
            "cantidad": 60
        },
        {
            "nombre": "UPS / Respaldo",
            "id": "528",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSUPS03K72R/TJS/X/portada_0S400.PNG",
            "cantidad": 5
        },
        {
            "nombre": "Videograbadoras Móviles y Portátiles",
            "id": "552",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSMI9605Q36/GLF1T/portada_0S400.PNG",
            "cantidad": 47
        },
        {
            "nombre": "Videograbadoras Móviles, Dash Cams y Body Cams",
            "id": "525",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSMDS005/2T/32/FP/ICB/portada_0S400.PNG",
            "cantidad": 114
        },
        {
            "nombre": "Videoporteros e Interfonos",
            "id": "469",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSKD9633WBE6/DSKD9633WBE6-p.PNG",
            "cantidad": 77
        },
        {
            "nombre": "Videoporteros e Interfonos",
            "id": "226",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSKD9633WBE6/DSKD9633WBE6-p.PNG",
            "cantidad": 70
        },
        {
            "nombre": "Videowalls",
            "id": "66533",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSKLED094K/portada_0S400.PNG",
            "cantidad": 146
        },
        {
            "nombre": "Visión y Lectores",
            "id": "66647",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKROBOT/DSMDT201_64G_GLE/DSMDT201_64G_GLE-p.PNG",
            "cantidad": 2
        },
        {
            "nombre": "VoIP - Telefonía IP - Videoconferencia",
            "id": "301",
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSD5C65RB_B/DSD5C65RB_B-p.PNG",
            "cantidad": 53
        }
    ]
}
Api marcas por productos
https://developers.syscom.mx/api/v1/marcas/syscom/productos?categoria=499
 parámetros que puede recibir 
 categoria=499 stock=1 agrupar=1 pagina=1
Resultado
{
    "cantidad": 8,
    "pagina": 1,
    "paginas": 1,
    "productos": [
        {
            "producto_id": "198111",
            "modelo": "EXPERTGABACOR",
            "total_existencia": 0,
            "titulo": "Curso de Motores de Garage en aplicaciones en aplicaciones de de puertas Corredizas y Abatibles ",
            "marca": "SYSCOM",
            "garantia": "",
            "sat_key": "80111500",
            "sat_description": "Desarrollo de recursos humanos",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/SYSCOM/EXPERTGABACOR/EXPERTGABACOR-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/EXPERTGABACOR-SYSCOM-198111.html",
            "categorias": [
                {
                    "id": "2925",
                    "nombre": "Barreras Vehiculares ",
                    "nivel": 3
                },
                {
                    "id": "499",
                    "nombre": "Acceso Vehicular",
                    "nivel": 2
                },
                {
                    "id": "37",
                    "nombre": "Control  de Acceso ",
                    "nivel": 1
                }
            ],
            "pvol": "0",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/syscom.png",
            "link": "/producto/EXPERTGABACOR-SYSCOM-198111.html",
            "imagen_360": [],
            "iconos": [],
            "peso": "-",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "-",
            "largo": "-",
            "ancho": "-",
            "precios": {
                "precio_1": "2.30",
                "precio_especial": "2.30",
                "precio_descuento": "1.47",
                "precio_lista": "2.30"
            },
            "existencia": {
                "nuevo": 0,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "85203",
            "modelo": "XB-PARK-1L",
            "total_existencia": 1,
            "titulo": "Bolardo Retráctil C / Llave P / Gestion y Control D / Estacionamientos  ",
            "marca": "Syscom",
            "garantia": "3 años",
            "sat_key": "46161500",
            "sat_description": "Control de tr?fico",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/SYSCOM/XBPARK1L/XBPARK1L-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/XB-PARK-1L-Syscom-85203.html",
            "categorias": [
                {
                    "id": "2938",
                    "nombre": "Pilonas o Bolardos",
                    "nivel": 3
                },
                {
                    "id": "499",
                    "nombre": "Acceso Vehicular",
                    "nivel": 2
                },
                {
                    "id": "37",
                    "nombre": "Control  de Acceso ",
                    "nivel": 1
                }
            ],
            "pvol": "4.836",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/syscom.png",
            "link": "/producto/XB-PARK-1L-Syscom-85203.html",
            "imagen_360": [
                "360_GRADOS/SYSCOM/XBPARK1L/2024_07_23_07_28"
            ],
            "iconos": [],
            "peso": "7.45",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "13",
            "largo": "93",
            "ancho": "20",
            "precios": {
                "precio_1": "112.11",
                "precio_especial": "93.67",
                "precio_descuento": "59.94",
                "precio_lista": "112.11"
            },
            "existencia": {
                "nuevo": 0,
                "asterisco": {
                    "a": 1,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "75186",
            "modelo": "ARM-PLUS-55/2",
            "total_existencia": 1,
            "titulo": "Brazo para  liftpro de 2 metros de largo.",
            "marca": "SYSCOM",
            "garantia": "3 años",
            "sat_key": "46171619",
            "sat_description": "",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/ARMPLUS552/ARMPLUS55t.jpg",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/ARM-PLUS-55-2-SYSCOM-75186.html",
            "categorias": [
                {
                    "id": "2926",
                    "nombre": "Accesorios ",
                    "nivel": 3
                },
                {
                    "id": "499",
                    "nombre": "Acceso Vehicular",
                    "nivel": 2
                },
                {
                    "id": "37",
                    "nombre": "Control  de Acceso ",
                    "nivel": 1
                }
            ],
            "pvol": "0",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/syscom.png",
            "link": "/producto/ARM-PLUS-55-2-SYSCOM-75186.html",
            "imagen_360": [],
            "iconos": [],
            "peso": "-",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "-",
            "largo": "-",
            "ancho": "-",
            "precios": {
                "precio_1": "390.00",
                "precio_especial": "390.00",
                "precio_descuento": "249.60",
                "precio_lista": "390.00"
            },
            "existencia": {
                "nuevo": 0,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 1,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "176652",
            "modelo": "119-GL1-20MX",
            "total_existencia": 3,
            "titulo": "Puerta Para Gabinete 119G795MX ",
            "marca": "Syscom",
            "garantia": "3 años",
            "sat_key": "43223306",
            "sat_description": "Gabinete o cerramiento para sistemas de red",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/SYSCOM/119GL120MX/119GL120MX-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/119-GL1-20MX-Syscom-176652.html",
            "categorias": [
                {
                    "id": "66066",
                    "nombre": "Refacciones",
                    "nivel": 3
                },
                {
                    "id": "499",
                    "nombre": "Acceso Vehicular",
                    "nivel": 2
                },
                {
                    "id": "37",
                    "nombre": "Control  de Acceso ",
                    "nivel": 1
                }
            ],
            "pvol": "0.9408",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/syscom.png",
            "link": "/producto/119-GL1-20MX-Syscom-176652.html",
            "imagen_360": [],
            "iconos": [],
            "peso": "2.20",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "2",
            "largo": "98",
            "ancho": "24",
            "precios": {
                "precio_1": "49.00",
                "precio_especial": "19.78",
                "precio_descuento": "12.65",
                "precio_lista": "49.00"
            },
            "existencia": {
                "nuevo": 3,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "4327",
            "modelo": "30006004",
            "total_existencia": 0,
            "titulo": "Calefactor para Barrera Vehicular.",
            "marca": "SYSCOM",
            "garantia": "3 años",
            "sat_key": "46171619",
            "sat_description": "Sistemas de seguridad o de control de acceso",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/catalogo/30006004/30006004det.jpg",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/30006004-SYSCOM-4327.html",
            "categorias": [
                {
                    "id": "2926",
                    "nombre": "Accesorios ",
                    "nivel": 3
                },
                {
                    "id": "499",
                    "nombre": "Acceso Vehicular",
                    "nivel": 2
                },
                {
                    "id": "37",
                    "nombre": "Control  de Acceso ",
                    "nivel": 1
                }
            ],
            "pvol": "1.02",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/syscom.png",
            "link": "/producto/30006004-SYSCOM-4327.html",
            "imagen_360": [],
            "iconos": {
                "sup_izq": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/liquidacion.png"
            },
            "peso": "0.66",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "-",
            "largo": "-",
            "ancho": "-",
            "precios": {
                "precio_1": "196.82",
                "precio_especial": "196.82",
                "precio_descuento": "125.96",
                "precio_lista": "196.82"
            },
            "existencia": {
                "nuevo": 0,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "66221",
            "modelo": "3000-6533",
            "total_existencia": 0,
            "titulo": "BRAZO SYS. P/BARRERA VEHIC.3.5MTS",
            "marca": "Syscom",
            "garantia": "3 años",
            "sat_key": "No disponible.",
            "sat_description": "No disponible.",
            "img_portada": "",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/3000-6533-Syscom-66221.html",
            "categorias": [
                {
                    "id": "2926",
                    "nombre": "Accesorios ",
                    "nivel": 3
                },
                {
                    "id": "499",
                    "nombre": "Acceso Vehicular",
                    "nivel": 2
                },
                {
                    "id": "37",
                    "nombre": "Control  de Acceso ",
                    "nivel": 1
                }
            ],
            "pvol": "7.6",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/syscom.png",
            "link": "/producto/3000-6533-Syscom-66221.html",
            "imagen_360": [],
            "iconos": [],
            "peso": "15.50",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "10",
            "largo": "380",
            "ancho": "10",
            "precios": {
                "precio_1": "186.00",
                "precio_especial": "186.00",
                "precio_descuento": "119.04",
                "precio_lista": "186.00"
            },
            "existencia": {
                "nuevo": 0,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "4336",
            "modelo": "30006538",
            "total_existencia": 0,
            "titulo": "Kit de Accesorios para Barrera Vehicular. Incluye Tornillos, Abrazaderas y llaves.",
            "marca": "SYSCOM",
            "garantia": "3 años",
            "sat_key": "46171619",
            "sat_description": "Sistemas de seguridad o de control de acceso",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/catalogo/30006538/30006538det.jpg",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/30006538-SYSCOM-4336.html",
            "categorias": [
                {
                    "id": "2926",
                    "nombre": "Accesorios ",
                    "nivel": 3
                },
                {
                    "id": "499",
                    "nombre": "Acceso Vehicular",
                    "nivel": 2
                },
                {
                    "id": "37",
                    "nombre": "Control  de Acceso ",
                    "nivel": 1
                }
            ],
            "pvol": "0.4224",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/syscom.png",
            "link": "/producto/30006538-SYSCOM-4336.html",
            "imagen_360": [],
            "iconos": {
                "sup_izq": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/liquidacion.png"
            },
            "peso": "1.56",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "8",
            "largo": "22",
            "ancho": "12",
            "precios": {
                "precio_1": "69.00",
                "precio_especial": "69.00",
                "precio_descuento": "44.16",
                "precio_lista": "69.00"
            },
            "existencia": {
                "nuevo": 0,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "176643",
            "modelo": "119-G79-5MX",
            "total_existencia": 0,
            "titulo": "Gabinete Color Beige Para Barrera Came / Compatible con Serie Hibrida / No Incluye Puerta ",
            "marca": "Syscom",
            "garantia": "3 años",
            "sat_key": "43223306",
            "sat_description": "Gabinete o cerramiento para sistemas de red",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/SYSCOM/119G795MX/119G795MX-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/119-G79-5MX-Syscom-176643.html",
            "categorias": [
                {
                    "id": "66066",
                    "nombre": "Refacciones",
                    "nivel": 3
                },
                {
                    "id": "499",
                    "nombre": "Acceso Vehicular",
                    "nivel": 2
                },
                {
                    "id": "37",
                    "nombre": "Control  de Acceso ",
                    "nivel": 1
                }
            ],
            "pvol": "0",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/syscom.png",
            "link": "/producto/119-G79-5MX-Syscom-176643.html",
            "imagen_360": [],
            "iconos": [],
            "peso": "35.00",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "-",
            "largo": "-",
            "ancho": "-",
            "precios": {
                "precio_1": "295.00",
                "precio_especial": "295.00",
                "precio_descuento": "188.80",
                "precio_lista": "295.00"
            },
            "existencia": {
                "nuevo": 0,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        }
    ],
    "todo": true
}
Api búsqueda productos
https://developers.syscom.mx/api/v1/productos?busqueda=camaras&stock=1
parámetro
categoria=206
marca=syscom
busqueda=camara
sucursal=mexico_sur
orden=
orden=1 agrupar=1 pagina=1
resultados
{
    "cantidad": 458,
    "pagina": 1,
    "paginas": 8,
    "productos": [
        {
            "producto_id": "211956",
            "modelo": "THC-B129-PS",
            "total_existencia": 500,
            "titulo": "[ColorVu] Bala TURBOHD 2 Megapixel (1080p) / Imagen a Color 24/7 / Lente 2.8 mm / Luz Blanca 20 mts / IP66 / Policarbonato / Microfono Integrado",
            "marca": "HiLook by HIKVISION",
            "garantia": "3 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HILOOKBYHIKVISION/THCB129PS/THCB129PS-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/THC-B129-PS-HiLook+by+HIKVISION-211956.html",
            "categorias": [
                {
                    "id": "65776",
                    "nombre": "Bala",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.198",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hilook_by_hikvision.png",
            "link": "/producto/THC-B129-PS-HiLook-by-HIKVISION-211956.html",
            "imagen_360": [
                "360_GRADOS/HILOOKBYHIKVISION/THCB129PS/2024_05_04_05_53"
            ],
            "iconos": [],
            "peso": "0.21",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "8",
            "largo": "17",
            "ancho": "8",
            "precios": {
                "precio_1": "37.50",
                "precio_especial": "28.67",
                "precio_descuento": "16.51",
                "volumen": {
                    "5": "16.34",
                    "15": "16.18",
                    "50": "16.01"
                },
                "precio_lista": "37.50"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "217754",
            "modelo": "IPC-B121H-C",
            "total_existencia": 500,
            "titulo": "HiLook Series / Bala IP 2 Megapixel (1080p) / Lente 2.8 mm / 20 mts IR / Exterior IP67 / PoE / dWDR / H.265+ / ONVIF",
            "marca": "HiLook by HIKVISION",
            "garantia": "3 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HILOOKBYHIKVISION/IPCB121HC/IPCB121HC-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/IPC-B121H-C-HiLook+by+HIKVISION-217754.html",
            "categorias": [
                {
                    "id": "1323",
                    "nombre": "Bala",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.61",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hilook_by_hikvision.png",
            "link": "/producto/IPC-B121H-C-HiLook-by-HIKVISION-217754.html",
            "imagen_360": [],
            "iconos": [],
            "peso": "0.26",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "12",
            "largo": "22",
            "ancho": "12",
            "precios": {
                "precio_1": "46.25",
                "precio_especial": "40.59",
                "precio_descuento": "23.37",
                "volumen": {
                    "5": "23.14",
                    "15": "22.91",
                    "50": "22.67"
                },
                "precio_lista": "46.25"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "210632",
            "modelo": "DS-2CD2347G2P-LSU/SL(C)",
            "total_existencia": 502,
            "titulo": "[FlexVu] [PROTECCIÓN ACTIVA] Turret IP Panorámica 4 Megapíxel / 2 Lentes 2.8 mm (180°) / Imagen a Color 24/7 (ColorVu) / PoE / WDR 130° / IP67 / ACUSENSE / Luz Estroboscópica y Alarma Audible / 30 mts Luz Blanca / Mic",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CD2347G2PLSU_SL(C)/DS2CD2347G2PLSU_SL(C)-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CD2347G2P-LSU-SL%28C%29-HIKVISION-210632.html",
            "categorias": [
                {
                    "id": "1320",
                    "nombre": "Fisheye y Hemisféricas",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CD2347G2P-LSU-SL(C)-HIKVISION-210632.html",
            "imagen_360": [
                "360_GRADOS/HIKVISION/DS2CD2347G2PLSU_SL(C)/2024_09_19_09_44"
            ],
            "iconos": [],
            "peso": "1.70",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "-",
            "largo": "-",
            "ancho": "-",
            "precios": {
                "precio_1": "290.08",
                "precio_especial": "273.98",
                "precio_descuento": "175.34",
                "precio_lista": "290.08"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 2,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "217236",
            "modelo": "DS-2CE76K0T-LMFS",
            "total_existencia": 500,
            "titulo": "[Dual Light + ColorVu] Turret TURBOHD 3K (5 Megapixel) / Lente 2.8 mm / 30 mts IR + 20 mts Luz Blanca / Gran Angular 104.9° / Exterior IP67 / Micrófono Integrado / dWDR / 4 Tecnologías / Metal",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CE76K0TLMFS/DS2CE76K0TLMFS-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CE76K0T-LMFS-HIKVISION-217236.html",
            "categorias": [
                {
                    "id": "65775",
                    "nombre": "Domo / Eyeball / Turret",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CE76K0T-LMFS-HIKVISION-217236.html",
            "imagen_360": [
                "360_GRADOS/HIKVISION/DS2CE76K0TLMFS/2024_04_11_04_55"
            ],
            "iconos": [],
            "peso": "0.45",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "-",
            "largo": "-",
            "ancho": "-",
            "precios": {
                "precio_1": "48.13",
                "precio_especial": "47.64",
                "precio_descuento": "30.48",
                "precio_lista": "48.13"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "230034",
            "modelo": "IDS-7216HQHI-M1/XT",
            "total_existencia": 500,
            "titulo": "DVR 16 Canales TURBOHD + 8 Canales IP / 5 Megapixel Lite - 3K Lite / Audio de Dos Vías por Coaxitron / Reconocimiento Facial / ACUSENSE (Evita falsas alarmas) / 1 Bahía de Disco Duro / Salida de Video en Full HD",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171621",
            "sat_description": "Grabadoras de video o audio de vigilancia",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/IDS7216HQHIM1_XT/IDS7216HQHIM1_XT-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/IDS-7216HQHI-M1-XT-HIKVISION-230034.html",
            "categorias": [
                {
                    "id": "2809",
                    "nombre": "Videograbadoras Analógicas - TurboHD TVI / AHD / CVI",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "2.07",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/IDS-7216HQHI-M1-XT-HIKVISION-230034.html",
            "imagen_360": [],
            "iconos": [],
            "peso": "2.07",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "30",
            "largo": "42",
            "ancho": "8",
            "precios": {
                "precio_1": "225.00",
                "precio_especial": "223.46",
                "precio_descuento": "143.01",
                "precio_lista": "225.00"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "211677",
            "modelo": "DS-9664NI-M8",
            "total_existencia": 13,
            "titulo": "[Doble Poder de Decodificación] NVR 32 Megapixel (8K) / 64 Canales IP / AcuSense / ANPR / Conteo de Personas / Heat Map / 8 Bahías de Disco Duro  / Soporta RAID con Hot Swap / 2 HDMI en 8K / Soporta POS / Alarmas I/O  / Smart Search",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171621",
            "sat_description": "Grabadoras de video o audio de vigilancia",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS9664NIM8/DS9664NIM8-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-9664NI-M8-HIKVISION-211677.html",
            "categorias": [
                {
                    "id": "1383",
                    "nombre": "NVRs Network Video Recorders",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "12.768",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-9664NI-M8-HIKVISION-211677.html",
            "proyecto": true,
            "imagen_360": [
                "360_GRADOS/HIKVISION/DS9664NIM8/2024_01_24_01_30"
            ],
            "iconos": [],
            "peso": "11.00",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "20",
            "largo": "57",
            "ancho": "56",
            "precios": {
                "precio_1": "3041.00",
                "precio_especial": "3041.00",
                "precio_descuento": "1824.60",
                "precio_lista": "3041.00"
            },
            "existencia": {
                "nuevo": 13,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "199807",
            "modelo": "DS-2CD1143G0-I(C)",
            "total_existencia": 500,
            "titulo": "Domo IP 4 Megapixel / Lente 2.8 mm / 30 mts IR / WDR 120 dB / Exterior IP67 / Hik-Connect P2P / H.265+ / PoE / ONVIF",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CD1143G0I(C)/DS2CD1143G0I(C)-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CD1143G0-I%28C%29-HIKVISION-199807.html",
            "categorias": [
                {
                    "id": "1325",
                    "nombre": "Domo / Eyeball / Turret",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CD1143G0-I(C)-HIKVISION-199807.html",
            "imagen_360": [
                "360_GRADOS/HIKVISION/DS2CD1143G0I(C)/2022_10_06_10_48"
            ],
            "iconos": [],
            "peso": "0.56",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "-",
            "largo": "-",
            "ancho": "-",
            "precios": {
                "precio_1": "99.14",
                "precio_especial": "93.53",
                "precio_descuento": "59.85",
                "precio_lista": "99.14"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "226411",
            "modelo": "DS-2DE2C400MWG-E",
            "total_existencia": 500,
            "titulo": "[FlexVu]  Domo PT IP 4 Megapixel / Lente 4 mm  / Dual Light (30 mts IR + 30 mts Luz Blanca)  / Autoseguimiento en Humanos / PoE / IP66 / Micrófono y Bocina Integrado (Audio de Dos Vías) / Micro SD / Incluye Montaje de Pared o Techo / ",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2DE2C400MWGE/DS2DE2C400MWGE-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2DE2C400MWG-E-HIKVISION-226411.html",
            "categorias": [
                {
                    "id": "1326",
                    "nombre": "PTZ",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2DE2C400MWG-E-HIKVISION-226411.html",
            "imagen_360": [],
            "iconos": [],
            "peso": "0.77",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "-",
            "largo": "-",
            "ancho": "-",
            "precios": {
                "precio_1": "89.60",
                "precio_especial": "87.33",
                "precio_descuento": "55.89",
                "precio_lista": "89.60"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "211960",
            "modelo": "E8-TURBO-C/A",
            "total_existencia": 500,
            "titulo": "[ColorVu] Eyeball TURBOHD 2 Megapíxel (1080p) / Lente 2.8 mm / Microfono Integrado / Imagen a Color 24/7 / METAL / Luz Blanca 20 mts / Exterior IP66 / TVI-AHD-CVI-CVBS / dWDR",
            "marca": "EPCOM PROFESSIONAL",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/EPCOM/E8TURBOC_A/E8TURBOC_A-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/E8-TURBO-C-A-EPCOM+PROFESSIONAL-211960.html",
            "categorias": [
                {
                    "id": "65775",
                    "nombre": "Domo / Eyeball / Turret",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.1444",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/epcom_professional.png",
            "link": "/producto/E8-TURBO-C-A-EPCOM-PROFESSIONAL-211960.html",
            "imagen_360": [
                "360_GRADOS/EPCOMPROFESSIONAL/E8TURBOC_A/2023_10_05_10_52"
            ],
            "iconos": [],
            "peso": "0.25",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "8",
            "largo": "10",
            "ancho": "10",
            "precios": {
                "precio_1": "36.92",
                "precio_especial": "32.43",
                "precio_descuento": "20.23",
                "precio_lista": "36.92"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "189229",
            "modelo": "DS-2CE10DF0T-F",
            "total_existencia": 500,
            "titulo": "[ColorVu] Bala TURBOHD 2 Megapixel (1080p) / Imagen a Color 24/7 / Lente 2.8 mm / METAL / Luz Blanca 20 mts / Exterior IP67 / TVI-AHD-CVI-CVBS / dWDR",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CE10DF0TF/DS2CE10DF0TF-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CE10DF0T-F-HIKVISION-189229.html",
            "categorias": [
                {
                    "id": "65776",
                    "nombre": "Bala",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.286208",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CE10DF0T-F-HIKVISION-189229.html",
            "imagen_360": [
                "360_GRADOS/HIKVISION/DS2CE10DF0TF/2021_06_29_06_48"
            ],
            "iconos": [],
            "peso": "0.49",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "8",
            "largo": "17",
            "ancho": "10",
            "precios": {
                "precio_1": "46.87",
                "precio_especial": "39.05",
                "precio_descuento": "24.99",
                "precio_lista": "46.87"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "217238",
            "modelo": "DS-2CE16K0T-LFS",
            "total_existencia": 500,
            "titulo": "[Dual Light + ColorVu] Bala TURBOHD 3K (5 Megapixel) / Lente 2.8 mm / 30 mts IR + 20 mts Luz Blanca / Gran Angular 104.9° / Exterior IP67 / Micrófono Integrado / dWDR / 4 Tecnologías / Metal",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CE16K0TLFS/DS2CE16K0TLFS-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CE16K0T-LFS-HIKVISION-217238.html",
            "categorias": [
                {
                    "id": "65776",
                    "nombre": "Bala",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CE16K0T-LFS-HIKVISION-217238.html",
            "imagen_360": [
                "360_GRADOS/HIKVISION/DS2CE16K0TLFS/2024_05_02_05_42"
            ],
            "iconos": [],
            "peso": "0.45",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "-",
            "largo": "-",
            "ancho": "-",
            "precios": {
                "precio_1": "49.09",
                "precio_especial": "46.15",
                "precio_descuento": "29.53",
                "precio_lista": "49.09"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "167226",
            "modelo": "B8-TURBO-G2W",
            "total_existencia": 500,
            "titulo": "Bala TURBOHD 2 Megapíxeles (1080p) / METALICA / Gran Angular 103° / Lente 2.8 mm / IR EXIR Inteligente 20 mts / Exterior IP66 / TVI-AHD-CVI-CVBS",
            "marca": "EPCOM PROFESSIONAL",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/EPCOM/B8TURBOG2W/B8TURBOG2W-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/B8-TURBO-G2W-EPCOM+PROFESSIONAL-167226.html",
            "categorias": [
                {
                    "id": "65776",
                    "nombre": "Bala",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.256",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/epcom_professional.png",
            "link": "/producto/B8-TURBO-G2W-EPCOM-PROFESSIONAL-167226.html",
            "imagen_360": [
                "360_GRADOS/EPCOM/B8TURBOG2W/2021_06_23_06_59"
            ],
            "iconos": [],
            "peso": "0.37",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "8",
            "largo": "16",
            "ancho": "10",
            "precios": {
                "precio_1": "31.00",
                "precio_especial": "19.89",
                "precio_descuento": "12.41",
                "volumen": {
                    "35": "12.16",
                    "50": "12.03",
                    "100": "11.91"
                },
                "precio_lista": "31.00"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "209170",
            "modelo": "DS-2DE2C400SCG-E(F1)",
            "total_existencia": 224,
            "titulo": "Domo PT IP 4 Megapixel / Lente 4 mm  / Luz Blanca 30 mts / dWDR  / PoE / IP66 / Micrófono y Bocina Interconstruido / Micro SD / Incluye Montaje de Pared y Techo",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2DE2C400SCGE(F1)/DS2DE2C400SCGE(F1)-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2DE2C400SCG-E%28F1%29-HIKVISION-209170.html",
            "categorias": [
                {
                    "id": "1326",
                    "nombre": "PTZ",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "1.5312",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2DE2C400SCG-E(F1)-HIKVISION-209170.html",
            "imagen_360": [
                "360_GRADOS/HIKVISION/DS2DE2C400SCGE(F1)/2023_07_12_07_23"
            ],
            "iconos": [],
            "peso": "1.15",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "17",
            "largo": "29",
            "ancho": "16",
            "precios": {
                "precio_1": "163.73",
                "precio_especial": "163.73",
                "precio_descuento": "104.78",
                "precio_lista": "163.73"
            },
            "existencia": {
                "nuevo": 224,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "210633",
            "modelo": "DS-2CD2T47G2P-LSU/SL(C)",
            "total_existencia": 381,
            "titulo": "[FlexVu] [PROTECCIÓN ACTIVA] Bala IP Panorámica 4 Megapixel / 2 Lentes 2.8 mm (180°) / Imagen a Color 24/7 (ColorVu) / PoE / WDR 130° / IP67 / ACUSENSE / Luz Estroboscópica y Alarma Audible / 40 mts Luz Blanca / Micro SD",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CD2T47G2PLSU_SL(C)/DS2CD2T47G2PLSU_SL(C)-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CD2T47G2P-LSU-SL%28C%29-HIKVISION-210633.html",
            "categorias": [
                {
                    "id": "1320",
                    "nombre": "Fisheye y Hemisféricas",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "2.7702",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CD2T47G2P-LSU-SL(C)-HIKVISION-210633.html",
            "imagen_360": [
                "360_GRADOS/HIKVISION/DS2CD2T47G2PLSU_SL(C)/2023_10_24_10_48"
            ],
            "iconos": [],
            "peso": "1.92",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "18",
            "largo": "41",
            "ancho": "19",
            "precios": {
                "precio_1": "312.61",
                "precio_especial": "310.05",
                "precio_descuento": "198.43",
                "precio_lista": "312.61"
            },
            "existencia": {
                "nuevo": 380,
                "asterisco": {
                    "a": 1,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "211874",
            "modelo": "DS-2XS2T47G1-LDH/4G/C18S40",
            "total_existencia": 52,
            "titulo": "Kit Solar IP All in One / Cámara Bala ColorVu 4 Megapixel / Lente 4 mm / Panel Solar / Batería de Respaldo de Litio 23.2Ah (Hasta 24 Días) / Conexión 4G / Accesorios de Instalación",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2XS2T47G1LDH_4G_C18S40/DS2XS2T47G1LDH_4G_C18S40-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2XS2T47G1-LDH-4G-C18S40-HIKVISION-211874.html",
            "categorias": [
                {
                    "id": "1323",
                    "nombre": "Bala",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "2.59",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2XS2T47G1-LDH-4G-C18S40-HIKVISION-211874.html",
            "proyecto": true,
            "imagen_360": [
                "360_GRADOS/HIKVISION/DS2XS2T47G1LDH_4G_C18S40/2022_09_20_09_06"
            ],
            "iconos": [],
            "peso": "1.67",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "18",
            "largo": "38",
            "ancho": "19",
            "precios": {
                "precio_1": "1907.35",
                "precio_especial": "1243.15",
                "precio_descuento": "795.61",
                "precio_lista": "1907.35"
            },
            "existencia": {
                "nuevo": 48,
                "asterisco": {
                    "a": 2,
                    "b": 1,
                    "c": 1,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "205721",
            "modelo": "DS-2CD2387G2P-LSU/SL(C)",
            "total_existencia": 278,
            "titulo": "[PROTECCIÓN ACTIVA] Turret IP Panorámica 8 Megapíxel / 2 Lentes 4 mm (180°) / Imagen a Color 24/7 (ColorVu) / PoE / WDR 130° / IP67 / ACUSENSE / Luz Estroboscópica y Alarma Audible / 30 mts Luz Blanca / Micro SD",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CD2387G2PLSU_SL(C)/DS2CD2387G2PLSU_SL(C)-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CD2387G2P-LSU-SL%28C%29-HIKVISION-205721.html",
            "categorias": [
                {
                    "id": "1320",
                    "nombre": "Fisheye y Hemisféricas",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CD2387G2P-LSU-SL(C)-HIKVISION-205721.html",
            "proyecto": true,
            "imagen_360": [
                "360_GRADOS/HIKVISION/DS2CD2387G2PLSU_SL(C)/2023_06_20_06_02"
            ],
            "iconos": [],
            "peso": "1.70",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "-",
            "largo": "-",
            "ancho": "-",
            "precios": {
                "precio_1": "430.00",
                "precio_especial": "398.69",
                "precio_descuento": "255.16",
                "precio_lista": "430.00"
            },
            "existencia": {
                "nuevo": 278,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "199864",
            "modelo": "E3K-TURBO-C",
            "total_existencia": 500,
            "titulo": "[ColorVu] Turret TURBOHD 3K (5 Megapixel) / Lente 2.8 mm / Micrófono Integrado / Imagen a Color 24/7 / 20 mts Luz Blanca / Exterior IP67 / dWDR / 4 Tecnologías",
            "marca": "EPCOM PROFESSIONAL",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/EPCOM/E3KTURBOC/E3KTURBOC-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/E3K-TURBO-C-EPCOM+PROFESSIONAL-199864.html",
            "categorias": [
                {
                    "id": "65775",
                    "nombre": "Domo / Eyeball / Turret",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.10237",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/epcom_professional.png",
            "link": "/producto/E3K-TURBO-C-EPCOM-PROFESSIONAL-199864.html",
            "imagen_360": [
                "360_GRADOS/EPCOMPROFESSIONAL/E3KTURBOC/2023_10_04_10_26"
            ],
            "iconos": [],
            "peso": "0.33",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "9",
            "largo": "8",
            "ancho": "8",
            "precios": {
                "precio_1": "66.00",
                "precio_especial": "60.61",
                "precio_descuento": "37.82",
                "precio_lista": "66.00"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "230033",
            "modelo": "IDS-7208HQHI-M1/XT",
            "total_existencia": 500,
            "titulo": "DVR 8 Canales TURBOHD + 4 Canales IP / 5 Megapixel Lite - 3K Lite / Audio de Dos Vías por Coaxitron / Reconocimiento Facial / ACUSENSE (Evista falsas alarmas) / 1 Bahía de Disco Duro / Salida de Video en Full HD",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171621",
            "sat_description": "Grabadoras de video o audio de vigilancia",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/IDS7208HQHIM1_XT/IDS7208HQHIM1_XT-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/IDS-7208HQHI-M1-XT-HIKVISION-230033.html",
            "categorias": [
                {
                    "id": "2809",
                    "nombre": "Videograbadoras Analógicas - TurboHD TVI / AHD / CVI",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "2.07068",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/IDS-7208HQHI-M1-XT-HIKVISION-230033.html",
            "imagen_360": [
                "360_GRADOS/HIKVISION/IDS7208HQHIM1_XT/2025_06_13_06_18"
            ],
            "iconos": [],
            "peso": "1.90",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "30",
            "largo": "42",
            "ancho": "8",
            "precios": {
                "precio_1": "150.00",
                "precio_especial": "138.66",
                "precio_descuento": "88.74",
                "precio_lista": "150.00"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "217755",
            "modelo": "IPC-T221H-C",
            "total_existencia": 500,
            "titulo": "HiLook Series / Turret IP 2 Megapixel / Lente 2.8 mm / 20 mts IR / Exterior IP67 / PoE / dWDR / H.265+ / ONVIF",
            "marca": "HiLook by HIKVISION",
            "garantia": "3 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HILOOKBYHIKVISION/IPCT221HC/IPCT221HC-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/IPC-T221H-C-HiLook+by+HIKVISION-217755.html",
            "categorias": [
                {
                    "id": "1325",
                    "nombre": "Domo / Eyeball / Turret",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.3861",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hilook_by_hikvision.png",
            "link": "/producto/IPC-T221H-C-HiLook-by-HIKVISION-217755.html",
            "imagen_360": [],
            "iconos": [],
            "peso": "0.40",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "11",
            "largo": "14",
            "ancho": "13",
            "precios": {
                "precio_1": "47.50",
                "precio_especial": "42.82",
                "precio_descuento": "24.66",
                "volumen": {
                    "5": "24.41",
                    "15": "24.17",
                    "50": "23.92"
                },
                "precio_lista": "47.50"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "221827",
            "modelo": "DVR-204G-M1(C)",
            "total_existencia": 500,
            "titulo": "DVR 4 Canales TurboHD + 1 Canal IP / 2 Megapíxel (1080p) Lite / Acusense Lite (Evita Falsas Alarmas) / Audio por Coaxitron / 1 Bahía de Disco Duro / H.265+ / Salida de Vídeo Full HD",
            "marca": "HiLook by HIKVISION",
            "garantia": "3 años",
            "sat_key": "46171621",
            "sat_description": "Grabadoras de video o audio de vigilancia",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HILOOKBYHIKVISION/DVR204GM1(C)/DVR204GM1(C)-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DVR-204G-M1%28C%29-HiLook+by+HIKVISION-221827.html",
            "categorias": [
                {
                    "id": "2809",
                    "nombre": "Videograbadoras Analógicas - TurboHD TVI / AHD / CVI",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "1.76",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hilook_by_hikvision.png",
            "link": "/producto/DVR-204G-M1(C)-HiLook-by-HIKVISION-221827.html",
            "imagen_360": [
                "360_GRADOS/HILOOKBYHIKVISION/DVR204GM1(C)/2025_06_10_06_47"
            ],
            "iconos": [],
            "peso": "1.44",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "8",
            "largo": "40",
            "ancho": "28",
            "precios": {
                "precio_1": "37.50",
                "precio_especial": "33.75",
                "precio_descuento": "19.44",
                "volumen": {
                    "5": "19.24",
                    "10": "19.05",
                    "35": "18.85"
                },
                "precio_lista": "37.50"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "218233",
            "modelo": "DS-2CD1023G2-LIU(F)",
            "total_existencia": 500,
            "titulo": "[Dual Light] Bala IP 2 Megapixel / Lente 2.8 mm / 30 mts IR + 30 mts Luz Blanca / Micrófono Integrado / ACUSENSE Lite / Exterior IP67 / H.265 / PoE  / Micro SD",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CD1023G2LIU(F)/DS2CD1023G2LIU(F)-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CD1023G2-LIU%28F%29-HIKVISION-218233.html",
            "categorias": [
                {
                    "id": "1323",
                    "nombre": "Bala",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.61681",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CD1023G2-LIU(F)-HIKVISION-218233.html",
            "imagen_360": [],
            "iconos": [],
            "peso": "0.28",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "12",
            "largo": "22",
            "ancho": "12",
            "precios": {
                "precio_1": "93.24",
                "precio_especial": "92.33",
                "precio_descuento": "59.09",
                "precio_lista": "93.24"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "205722",
            "modelo": "DS-2CD2T87G2-PLSU/SL(C)",
            "total_existencia": 368,
            "titulo": "[FlexVu] [PROTECCIÓN ACTIVA] Bala IP Panorámica 8 Megapixel (4K) / 2 Lentes 4 mm (180°) / Imagen a Color 24/7 (ColorVu) / PoE / WDR 130° / IP67 / ACUSENSE / Luz Estroboscópica y Alarma Audible / 40 mts Luz Blanca / Micro SD",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CD2T87G2PLSU_SL(C)/DS2CD2T87G2PLSU_SL(C)-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CD2T87G2-PLSU-SL%28C%29-HIKVISION-205722.html",
            "categorias": [
                {
                    "id": "1320",
                    "nombre": "Fisheye y Hemisféricas",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CD2T87G2-PLSU-SL(C)-HIKVISION-205722.html",
            "proyecto": true,
            "imagen_360": [
                "360_GRADOS/HIKVISION/DS2CD2T87G2PLSU_SL(C)/2023_10_24_10_19"
            ],
            "iconos": [],
            "peso": "1.70",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "-",
            "largo": "-",
            "ancho": "-",
            "precios": {
                "precio_1": "503.60",
                "precio_especial": "466.93",
                "precio_descuento": "298.83",
                "precio_lista": "503.60"
            },
            "existencia": {
                "nuevo": 368,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "211957",
            "modelo": "B8-TURBO-C/A",
            "total_existencia": 500,
            "titulo": "[ColorVu] Bala TURBOHD 2 Megapíxel (1080p) / Microfono Integrado / Imagen a color 24/7 / Lente 2.8 mm / METAL / Luz Blanca 20 mts / Exterior IP66 / TVI-AHD-CVI-CVBS / dWDR",
            "marca": "EPCOM PROFESSIONAL",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/EPCOM/B8TURBOC_A/B8TURBOC_A-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/B8-TURBO-C-A-EPCOM+PROFESSIONAL-211957.html",
            "categorias": [
                {
                    "id": "65776",
                    "nombre": "Bala",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.1568",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/epcom_professional.png",
            "link": "/producto/B8-TURBO-C-A-EPCOM-PROFESSIONAL-211957.html",
            "imagen_360": [
                "360_GRADOS/EPCOMPROFESSIONAL/B8TURBOC_A/2023_10_04_10_38"
            ],
            "iconos": [],
            "peso": "0.40",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "7",
            "largo": "16",
            "ancho": "7",
            "precios": {
                "precio_1": "36.39",
                "precio_especial": "32.73",
                "precio_descuento": "20.42",
                "precio_lista": "36.39"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "221944",
            "modelo": "DS-2CD1143G2-LIUF",
            "total_existencia": 501,
            "titulo": "Domo IP 4 Megapixel / Lente 2.8 mm / Dual Light (30 mts IR + 30 mts Luz Blanca) / Micrófono Integrado / Antivandálico IK08 / ACUSENSE Lite / Exterior IP67 / H.265 / PoE / ONVIF / Micro SD",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CD1143G2LIUF/DS2CD1143G2LIUF-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CD1143G2-LIUF-HIKVISION-221944.html",
            "categorias": [
                {
                    "id": "1325",
                    "nombre": "Domo / Eyeball / Turret",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.61681",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CD1143G2-LIUF-HIKVISION-221944.html",
            "imagen_360": [],
            "iconos": [],
            "peso": "0.28",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "12",
            "largo": "22",
            "ancho": "12",
            "precios": {
                "precio_1": "135.60",
                "precio_especial": "127.66",
                "precio_descuento": "81.70",
                "precio_lista": "135.60"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 1,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "211952",
            "modelo": "THC-T129-PS",
            "total_existencia": 501,
            "titulo": "[ColorVu] AUDIO POR COAXITRON / Turret TURBOHD 1080p / Imagen a Color 24/7 / Lente 2.8 mm / Luz Blanca 20 mts / Uso Interior / Policarbonato",
            "marca": "HiLook by HIKVISION",
            "garantia": "3 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HILOOKBYHIKVISION/THCT129PS/THCT129PS-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/THC-T129-PS-HiLook+by+HIKVISION-211952.html",
            "categorias": [
                {
                    "id": "65775",
                    "nombre": "Domo / Eyeball / Turret",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.1444",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hilook_by_hikvision.png",
            "link": "/producto/THC-T129-PS-HiLook-by-HIKVISION-211952.html",
            "imagen_360": [
                "360_GRADOS/HILOOKBYHIKVISION/THCT129PS/2024_05_16_05_43"
            ],
            "iconos": [],
            "peso": "0.20",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "8",
            "largo": "10",
            "ancho": "10",
            "precios": {
                "precio_1": "37.50",
                "precio_especial": "29.01",
                "precio_descuento": "16.70",
                "volumen": {
                    "5": "16.54",
                    "15": "16.37",
                    "50": "16.20"
                },
                "precio_lista": "37.50"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 1,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "200678",
            "modelo": "THC-T120-M",
            "total_existencia": 500,
            "titulo": "Turret TURBOHD 2 Megapíxeles (1080p) / Lente 2.8 mm / 20 mts IR EXIR / TVI-AHD-CVI-CVBS / IP66 / Metal",
            "marca": "HiLook by HIKVISION",
            "garantia": "3 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HILOOKBYHIKVISION/THCT120M/THCT120M-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/THC-T120-M-HiLook+by+HIKVISION-200678.html",
            "categorias": [
                {
                    "id": "65775",
                    "nombre": "Domo / Eyeball / Turret",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.1936",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hilook_by_hikvision.png",
            "link": "/producto/THC-T120-M-HiLook-by-HIKVISION-200678.html",
            "imagen_360": [
                "360_GRADOS/HILOOKBYHIKVISION/THCT120M/2023_05_10_05_07"
            ],
            "iconos": [],
            "peso": "0.20",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "8",
            "largo": "11",
            "ancho": "11",
            "precios": {
                "precio_1": "26.19",
                "precio_especial": "20.36",
                "precio_descuento": "11.72",
                "volumen": {
                    "5": "11.61",
                    "15": "11.49",
                    "50": "11.37"
                },
                "precio_lista": "26.19"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "199809",
            "modelo": "DS-2CD1343G0-I(C)",
            "total_existencia": 471,
            "titulo": "Turret IP 4 Megapixel / Lente 2.8 mm / 30 mts IR / WDR 120 dB / Exterior IP67 / Hik-Connect P2P / H.265+ / PoE / ONVIF ",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CD1343G0I(C)/DS2CD1343G0I(C)-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CD1343G0-I%28C%29-HIKVISION-199809.html",
            "categorias": [
                {
                    "id": "1325",
                    "nombre": "Domo / Eyeball / Turret",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CD1343G0-I(C)-HIKVISION-199809.html",
            "imagen_360": [
                "360_GRADOS/HIKVISION/DS2CD1343G0I(C)/2022_10_05_10_12"
            ],
            "iconos": [],
            "peso": "1.20",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "-",
            "largo": "-",
            "ancho": "-",
            "precios": {
                "precio_1": "116.20",
                "precio_especial": "99.27",
                "precio_descuento": "63.53",
                "precio_lista": "116.20"
            },
            "existencia": {
                "nuevo": 471,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "219665",
            "modelo": "DS-2CD1083G2-LIU(F)",
            "total_existencia": 440,
            "titulo": "[Dual Light] Bala IP 8 Megapixel (4K) / Lente 2.8 mm / 30 mts IR + 30 mts Luz Blanca / Micrófono Integrado / ACUSENSE Lite / Exterior IP67 / H.265 / PoE  / Micro SD",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CD1083G2LIU(F)/DS2CD1083G2LIU(F)-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CD1083G2-LIU%28F%29-HIKVISION-219665.html",
            "categorias": [
                {
                    "id": "1323",
                    "nombre": "Bala",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CD1083G2-LIU(F)-HIKVISION-219665.html",
            "imagen_360": [],
            "iconos": [],
            "peso": "0.28",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "-",
            "largo": "-",
            "ancho": "-",
            "precios": {
                "precio_1": "154.29",
                "precio_especial": "152.71",
                "precio_descuento": "97.73",
                "precio_lista": "154.29"
            },
            "existencia": {
                "nuevo": 438,
                "asterisco": {
                    "a": 1,
                    "b": 1,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "208812",
            "modelo": "TAPO-C320WS",
            "total_existencia": 500,
            "titulo": "Cámara IP 4 Megapixel (2K) / Lente 3.18 mm / Wi-Fi / 30 mts IR / Exterior IP66 / Audio Bidireccional / Micro SD  hasta 256 GB / Compatible con Google y Alexa",
            "marca": "TP-LINK",
            "garantia": "3 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/TP-LINK/TAPOC320WS/TAPOC320WS-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/TAPO-C320WS-TP-LINK-208812.html",
            "categorias": [
                {
                    "id": "66149",
                    "nombre": "WiFi / 4G / Inalámbricas",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/tp-link.png",
            "link": "/producto/TAPO-C320WS-TP-LINK-208812.html",
            "imagen_360": [
                "360_GRADOS/TP-LINK/TAPOC320WS/2024_04_18_04_20"
            ],
            "iconos": [],
            "peso": "1.00",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "-",
            "largo": "-",
            "ancho": "-",
            "precios": {
                "precio_1": "76.25",
                "precio_especial": "68.27",
                "precio_descuento": "41.50",
                "precio_lista": "76.25"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "196376",
            "modelo": "DS-2CE10UF3T-E",
            "total_existencia": 500,
            "titulo": "[ColorVu] Bala TURBOHD 4K (8 Megapixel) / Imagen a Color 24/7 / Lente 2.8 mm / METAL / Luz Blanca 20 mts / Exterior IP67 / WDR 130 dB ",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CE10UF3TE/DS2CE10UF3TE-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CE10UF3T-E-HIKVISION-196376.html",
            "categorias": [
                {
                    "id": "65776",
                    "nombre": "Bala",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.142324",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CE10UF3T-E-HIKVISION-196376.html",
            "imagen_360": [
                "360_GRADOS/HIKVISION/DS2CE10UF3TE/2023_04_17_04_12"
            ],
            "iconos": [],
            "peso": "0.44",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "7",
            "largo": "16",
            "ancho": "7",
            "precios": {
                "precio_1": "132.75",
                "precio_especial": "112.70",
                "precio_descuento": "72.12",
                "precio_lista": "132.75"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "205925",
            "modelo": "B8TURBOG2P/A/XPS",
            "total_existencia": 500,
            "titulo": "KIT DE CÁMARA + MONTAJE / Cámara Bala TURBOHD 2 Megapixel (1080p) / Gran Angular 106° / Lente 2.8 mm / 25 mts IR EXIR / Exterior IP66 / 4 Tecnologías / dWDR",
            "marca": "EPCOM PROFESSIONAL",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/EPCOM/B8TURBOG2P_A_XPS/B8TURBOG2P_A_XPS-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/B8TURBOG2P-A-XPS-EPCOM+PROFESSIONAL-205925.html",
            "categorias": [
                {
                    "id": "65776",
                    "nombre": "Bala",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.19173",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/epcom_professional.png",
            "link": "/producto/B8TURBOG2P-A-XPS-EPCOM-PROFESSIONAL-205925.html",
            "imagen_360": [],
            "iconos": [],
            "peso": "0.22",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "8",
            "largo": "17",
            "ancho": "8",
            "precios": {
                "precio_1": "46.20",
                "precio_especial": "36.95",
                "precio_descuento": "23.05",
                "precio_lista": "46.20"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "207843",
            "modelo": "DS-2CE16D0T-LFS",
            "total_existencia": 505,
            "titulo": "[Dual Light + ColorVu] Bala TURBOHD 2 Megapixel (1080p) / Lente 2.8 mm / 30 mts IR EXIR + 20 mts Luz Blanca / Micrófono Integrado / Gran Angular 101° / Exterior IP67 / 4 Tecnologías",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CE16D0TLFS/DS2CE16D0TLFS-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CE16D0T-LFS-HIKVISION-207843.html",
            "categorias": [
                {
                    "id": "65776",
                    "nombre": "Bala",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.183375",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CE16D0T-LFS-HIKVISION-207843.html",
            "imagen_360": [
                "360_GRADOS/HIKVISION/DS2CE16D0TLFS/2024_05_04_05_17"
            ],
            "iconos": [],
            "peso": "0.46",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "8",
            "largo": "16",
            "ancho": "8",
            "precios": {
                "precio_1": "43.70",
                "precio_especial": "40.66",
                "precio_descuento": "26.02",
                "precio_lista": "43.70"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 4,
                    "b": 1,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "229430",
            "modelo": "TAPO-C500",
            "total_existencia": 500,
            "titulo": "Cámara IP Wi-Fi 2 megapixel / Visión 360 / Audio doble vías / Visión Nocturna /  Notificación Push / Memoria Micro SD  ",
            "marca": "TP-LINK",
            "garantia": "3 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/TP-LINK/TAPOC500/TAPOC500-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/TAPO-C500-TP-LINK-229430.html",
            "categorias": [
                {
                    "id": "1326",
                    "nombre": "PTZ",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.0000002",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/tp-link.png",
            "link": "/producto/TAPO-C500-TP-LINK-229430.html",
            "imagen_360": [],
            "iconos": [],
            "peso": "0.10",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "-",
            "largo": "-",
            "ancho": "-",
            "precios": {
                "precio_1": "68.75",
                "precio_especial": "60.57",
                "precio_descuento": "36.82",
                "precio_lista": "68.75"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "167224",
            "modelo": "E8-TURBO-G2W",
            "total_existencia": 500,
            "titulo": "Turret TURBOHD 2 Megapixel (1080p) / METÁLICA / Gran Angular 103° / Lente 2.8 mm / IR EXIR 20 Mts / Exterior IP66 / TVI-AHD-CVI-CVBS / dWDR",
            "marca": "EPCOM PROFESSIONAL",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/EPCOMPROFESSIONAL/E8TURBOG2W/E8TURBOG2W-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/E8-TURBO-G2W-EPCOM+PROFESSIONAL-167224.html",
            "categorias": [
                {
                    "id": "65775",
                    "nombre": "Domo / Eyeball / Turret",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.1936",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/epcom_professional.png",
            "link": "/producto/E8-TURBO-G2W-EPCOM-PROFESSIONAL-167224.html",
            "imagen_360": [
                "360_GRADOS/EPCOM/E8TURBOG2W/2021_05_28_05_09"
            ],
            "iconos": [],
            "peso": "0.29",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "8",
            "largo": "11",
            "ancho": "11",
            "precios": {
                "precio_1": "26.80",
                "precio_especial": "18.48",
                "precio_descuento": "11.53",
                "precio_lista": "26.80"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "222037",
            "modelo": "DS-2CD2955G0-ISU",
            "total_existencia": 500,
            "titulo": "Mini Fisheye IP 5 Megapixel / Panorámica 180° - 360° / Microfono Integrado / 8 mts IR / Uso en Interior / PoE / Múltiples Vistas por iVMS-4200 / Alarmas I/O / Micro SD",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CD2955G0ISU/DS2CD2955G0ISU-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CD2955G0-ISU-HIKVISION-222037.html",
            "categorias": [
                {
                    "id": "1320",
                    "nombre": "Fisheye y Hemisféricas",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.36",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CD2955G0-ISU-HIKVISION-222037.html",
            "imagen_360": [],
            "iconos": [],
            "peso": "0.50",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "15",
            "largo": "12",
            "ancho": "10",
            "precios": {
                "precio_1": "302.00",
                "precio_especial": "264.74",
                "precio_descuento": "169.43",
                "precio_lista": "302.00"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "207844",
            "modelo": "DS-2CE76D0T-LMFS",
            "total_existencia": 500,
            "titulo": "[Dual Light + ColorVu] Turret TURBOHD 2 Megapixel (1080p) / Lente 2.8 mm / 30 mts IR + 20 mts Luz Blanca / Gran Angular 101° / Exterior IP67 / Micrófono Integrado /  4 Tecnologías /  Metal ",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CE76D0TLMFS/DS2CE76D0TLMFS-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CE76D0T-LMFS-HIKVISION-207844.html",
            "categorias": [
                {
                    "id": "65775",
                    "nombre": "Domo / Eyeball / Turret",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.21",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CE76D0T-LMFS-HIKVISION-207844.html",
            "imagen_360": [
                "360_GRADOS/HIKVISION/DS2CE76D0TLMFS/2024_04_23_04_21"
            ],
            "iconos": [],
            "peso": "0.39",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "9",
            "largo": "11",
            "ancho": "11",
            "precios": {
                "precio_1": "48.50",
                "precio_especial": "43.26",
                "precio_descuento": "27.68",
                "precio_lista": "48.50"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "199821",
            "modelo": "DS-2CE72KF0T-FS",
            "total_existencia": 502,
            "titulo": "[ColorVu] Turret TURBOHD 3K (5 Megapixel) / Micrófono Integrado / Lente 3.6 mm / Imagen a Color 24/7 / 40 mts Luz Blanca / Exterior IP67 / dWDR / 4 Tecnologías",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CE72KF0TFS/DS2CE72KF0TFS-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CE72KF0T-FS-HIKVISION-199821.html",
            "categorias": [
                {
                    "id": "65775",
                    "nombre": "Domo / Eyeball / Turret",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.10237",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CE72KF0T-FS-HIKVISION-199821.html",
            "imagen_360": [
                "360_GRADOS/HIKVISION/DS2CE72KF0TFS/2023_04_17_04_59"
            ],
            "iconos": [],
            "peso": "0.42",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "9",
            "largo": "8",
            "ancho": "8",
            "precios": {
                "precio_1": "71.08",
                "precio_especial": "70.87",
                "precio_descuento": "45.35",
                "precio_lista": "71.08"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 2,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "196292",
            "modelo": "DS-U02",
            "total_existencia": 500,
            "titulo": "Cámara Web ALTA DENIFICIÓN (1080p) / Giro 360° / Gran Angular / Micrófono Integrado / Conector USB de 2 mts / Fácil de Instalar / Reducción de Ruido Inteligente",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "45111902",
            "sat_description": "Sistemas de video conferencias",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DSU02/DSU02-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-U02-HIKVISION-196292.html",
            "categorias": [
                {
                    "id": "66032",
                    "nombre": "Audio/Video Conferencia",
                    "nivel": 3
                },
                {
                    "id": "301",
                    "nombre": "VoIP - Telefonía IP - Videoconferencia",
                    "nivel": 2
                },
                {
                    "id": "26",
                    "nombre": "Redes e IT",
                    "nivel": 1
                }
            ],
            "pvol": "0",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-U02-HIKVISION-196292.html",
            "imagen_360": [
                "360_GRADOS/HIKVISION/DSU02/2022_10_05_10_24"
            ],
            "iconos": [],
            "peso": "0.14",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "-",
            "largo": "-",
            "ancho": "-",
            "precios": {
                "precio_1": "32.30",
                "precio_especial": "29.95",
                "precio_descuento": "18.68",
                "precio_lista": "32.30"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "220978",
            "modelo": "DS-2CD1023G2-LIU",
            "total_existencia": 500,
            "titulo": "Bala IP 2 Megapixel / Lente 2.8 mm / Dual Light (30 mts IR + 30 mts Luz Blanca)  / ACUSENSE Lite / Exterior IP67 / H.265+ / PoE  ",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CD1023G2LIU/DS2CD1023G2LIU-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CD1023G2-LIU-HIKVISION-220978.html",
            "categorias": [
                {
                    "id": "1323",
                    "nombre": "Bala",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.59",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CD1023G2-LIU-HIKVISION-220978.html",
            "imagen_360": [
                "360_GRADOS/HIKVISION/DS2CD1023G2LIU/2024_10_31_10_20"
            ],
            "iconos": [],
            "peso": "0.43",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "12",
            "largo": "22",
            "ancho": "12",
            "precios": {
                "precio_1": "81.45",
                "precio_especial": "81.22",
                "precio_descuento": "51.98",
                "precio_lista": "81.45"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "196305",
            "modelo": "THC-B129-P",
            "total_existencia": 500,
            "titulo": "Bala TURBOHD 2 Megapixel (1080p) / Imagen a Color 24/7 / Lente 2.8 mm / ColorVu Lite / Luz Blanca 20 mts / IP66 / Policarbonato",
            "marca": "HiLook by HIKVISION",
            "garantia": "3 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HILOOKBYHIKVISION/THCB129P/THCB129P-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/THC-B129-P-HiLook+by+HIKVISION-196305.html",
            "categorias": [
                {
                    "id": "65776",
                    "nombre": "Bala",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.19173",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hilook_by_hikvision.png",
            "link": "/producto/THC-B129-P-HiLook-by-HIKVISION-196305.html",
            "imagen_360": [
                "360_GRADOS/HILOOKBYHIKVISION/THCB129P/2024_01_23_01_27"
            ],
            "iconos": [],
            "peso": "0.22",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "8",
            "largo": "17",
            "ancho": "8",
            "precios": {
                "precio_1": "29.50",
                "precio_especial": "27.18",
                "precio_descuento": "15.65",
                "volumen": {
                    "5": "15.49",
                    "15": "15.34",
                    "50": "15.18"
                },
                "precio_lista": "29.50"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "176092",
            "modelo": "PS-12DC4KV",
            "total_existencia": 500,
            "titulo": "Fuente de Alimentación de 12 Vcc @ 5A / 4 Cámaras / FILTRO DE RUIDO ESPECIAL PARA CAMARAS 4K / Fusible Reseteable Inter Construido PTC / Protección Contra Sobre-Tensiones y Contra Cortocircuito / Recomendado para cámaras 4K.",
            "marca": "EPCOM POWERLINE",
            "garantia": "3 años",
            "sat_key": "39121009",
            "sat_description": "Reguladores el?ctricos o de potencia",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/EPCOMPOWERLINE/PS12DC4KV/PS12DC4KV-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/PS-12DC4KV-EPCOM+POWERLINE-176092.html",
            "categorias": [
                {
                    "id": "2975",
                    "nombre": "Fuentes de Alimentación",
                    "nivel": 3
                },
                {
                    "id": "208",
                    "nombre": "Energía",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.52",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/epcom_powerline.png",
            "link": "/producto/PS-12DC4KV-EPCOM-POWERLINE-176092.html",
            "imagen_360": [
                "360_GRADOS/EPCOMPOWERLINE/PS12DC4KV/2021_06_25_06_42"
            ],
            "iconos": [],
            "peso": "0.37",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "5",
            "largo": "26",
            "ancho": "20",
            "precios": {
                "precio_1": "24.00",
                "precio_especial": "20.56",
                "precio_descuento": "13.15",
                "precio_lista": "24.00"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "226382",
            "modelo": "NVR-108H-D/8P(D)",
            "total_existencia": 500,
            "titulo": "NVR 4 Megapixel (Compatible con Cámaras AcuSense) / 8 Canales IP / 8 Puertos PoE+ / 1 Bahía de Disco Duro / Salida en Full HD",
            "marca": "HiLook by HIKVISION",
            "garantia": "3 años",
            "sat_key": "46171621",
            "sat_description": "Grabadoras de video o audio de vigilancia",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HILOOKBYHIKVISION/NVR108HD_8P(D)/NVR108HD_8P(D)-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/NVR-108H-D-8P%28D%29-HiLook+by+HIKVISION-226382.html",
            "categorias": [
                {
                    "id": "1383",
                    "nombre": "NVRs Network Video Recorders",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "2.29",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hilook_by_hikvision.png",
            "link": "/producto/NVR-108H-D-8P(D)-HiLook-by-HIKVISION-226382.html",
            "imagen_360": [],
            "iconos": [],
            "peso": "0.90",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "8",
            "largo": "52",
            "ancho": "27",
            "precios": {
                "precio_1": "161.00",
                "precio_especial": "146.24",
                "precio_descuento": "84.23",
                "volumen": {
                    "5": "83.39",
                    "15": "82.54",
                    "35": "81.70"
                },
                "precio_lista": "161.00"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "219926",
            "modelo": "DS-2XS3Q47G1-LDH/4G/C18S40",
            "total_existencia": 18,
            "titulo": "Kit Solar IP All in One / Cámara PT ColorVu 4 Megapixel / Lente 4 mm / Panel Solar / Batería de Respaldo de Litio 23.2Ah (Hasta 24 Días) / Conexión 4G / Accesorios de Instalación",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2XS3Q47G1LDH_4G_C18S40/DS2XS3Q47G1LDH_4G_C18S40-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2XS3Q47G1-LDH-4G-C18S40-HIKVISION-219926.html",
            "categorias": [
                {
                    "id": "1326",
                    "nombre": "PTZ",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "2.5992",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2XS3Q47G1-LDH-4G-C18S40-HIKVISION-219926.html",
            "proyecto": true,
            "imagen_360": [],
            "iconos": [],
            "peso": "1.67",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "18",
            "largo": "38",
            "ancho": "19",
            "precios": {
                "precio_1": "1904.21",
                "precio_especial": "1904.21",
                "precio_descuento": "1142.52",
                "precio_lista": "1904.21"
            },
            "existencia": {
                "nuevo": 17,
                "asterisco": {
                    "a": 1,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "211958",
            "modelo": "B8-TURBO-PC/A",
            "total_existencia": 500,
            "titulo": "Bala TURBOHD 2 Megapíxel (1080p) / Lente 2.8 mm / ColorVu / Microfono Integrado / Imagen a Color 24/7 / Policarbonato / Luz Blanca 20 mts / Exterior IP66 / TVI-AHD-CVI-CVBS / dWDR",
            "marca": "EPCOM PROFESSIONAL",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/EPCOM/B8TURBOPC_A/B8TURBOPC_A-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/B8-TURBO-PC-A-EPCOM+PROFESSIONAL-211958.html",
            "categorias": [
                {
                    "id": "65776",
                    "nombre": "Bala",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.1568",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/epcom_professional.png",
            "link": "/producto/B8-TURBO-PC-A-EPCOM-PROFESSIONAL-211958.html",
            "imagen_360": [
                "360_GRADOS/EPCOMPROFESSIONAL/B8TURBOPC_A/2023_10_04_10_42"
            ],
            "iconos": [],
            "peso": "0.40",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "7",
            "largo": "16",
            "ancho": "7",
            "precios": {
                "precio_1": "41.80",
                "precio_especial": "33.33",
                "precio_descuento": "20.79",
                "precio_lista": "41.80"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "216441",
            "modelo": "DS-2CD3956G2-IS(U)",
            "total_existencia": 40,
            "titulo": "Mini Fisheye IP 5 Megapixel / Panorámica 180° - 360° / 8 mts IR / Interior / PoE / HEOP / ACUSENSE / Detección Facial / Microfono Integrado",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CD3956G2IS(U)/DS2CD3956G2IS(U)-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CD3956G2-IS%28U%29-HIKVISION-216441.html",
            "categorias": [
                {
                    "id": "1320",
                    "nombre": "Fisheye y Hemisféricas",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.36",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CD3956G2-IS(U)-HIKVISION-216441.html",
            "proyecto": true,
            "imagen_360": [],
            "iconos": [],
            "peso": "0.50",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "15",
            "largo": "12",
            "ancho": "10",
            "precios": {
                "precio_1": "410.40",
                "precio_especial": "410.40",
                "precio_descuento": "246.24",
                "precio_lista": "410.40"
            },
            "existencia": {
                "nuevo": 38,
                "asterisco": {
                    "a": 2,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "217670",
            "modelo": "DS-2SE4C425MWG-E/26(F0)",
            "total_existencia": 308,
            "titulo": "[TandemVu] PTZ IP 4 Megapixel con Cámara Panoramica 6 Megapixel / 25X Zoom / 100 mts IR / IP66  / WDR / PoE+ / Entrada-Salida de Audio y Alarma / Ultra Baja Iluminación / Micro SD",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2SE4C425MWGE_26(F0)/DS2SE4C425MWGE_26(F0)-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2SE4C425MWG-E-26%28F0%29-HIKVISION-217670.html",
            "categorias": [
                {
                    "id": "1326",
                    "nombre": "PTZ",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "3.02797",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2SE4C425MWG-E-26(F0)-HIKVISION-217670.html",
            "proyecto": true,
            "imagen_360": [],
            "iconos": [],
            "peso": "8.00",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "30",
            "largo": "30",
            "ancho": "17",
            "precios": {
                "precio_1": "815.91",
                "precio_especial": "804.25",
                "precio_descuento": "514.72",
                "precio_lista": "815.91"
            },
            "existencia": {
                "nuevo": 308,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "38012",
            "modelo": "JR-52",
            "total_existencia": 500,
            "titulo": "Adaptador Macho Tipo Jack de 3.5 mm Polarizado de 12 Vcc / Terminales Tipo Tornillo / Polarizado (+/-) / Ideal para Cámaras de Video Vigilancia. ",
            "marca": "EPCOM POWERLINE",
            "garantia": "3 años",
            "sat_key": "32151909",
            "sat_description": "Conector desmontable de campo",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/EPCOMPOWERLINE/JR52/JR52-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/JR-52-EPCOM+POWERLINE-38012.html",
            "categorias": [
                {
                    "id": "1295",
                    "nombre": "Para Alimentación y Electricidad",
                    "nivel": 3
                },
                {
                    "id": "206",
                    "nombre": "Cables y Conectores",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.0007",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/epcom_powerline.png",
            "link": "/producto/JR-52-EPCOM-POWERLINE-38012.html",
            "imagen_360": [
                "360_GRADOS/EPCOMPOWERLINE/JR52/2021_06_18_06_01"
            ],
            "iconos": [],
            "peso": "0.01",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "1",
            "largo": "4",
            "ancho": "1",
            "precios": {
                "precio_1": "1.01",
                "precio_especial": "0.50",
                "precio_descuento": "0.32",
                "volumen": {
                    "10": "0.31",
                    "30": "0.31",
                    "50": "0.30",
                    "100": "0.29",
                    "150": "0.28",
                    "200": "0.27"
                },
                "precio_lista": "1.01"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "162409",
            "modelo": "THC-B120-PC",
            "total_existencia": 500,
            "titulo": "Bala TURBOHD 2 Megapíxeles (1080p) / Gran Angular 103° / Lente 2.8 mm / IR EXIR Inteligente 20 mts / Exterior IP66 / dWDR / TVI-AHD-CVI-CVBS",
            "marca": "HiLook by HIKVISION",
            "garantia": "3 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HILOOKBYHIKVISION/THCB120PC/THCB120PC-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/THC-B120-PC-HiLook+by+HIKVISION-162409.html",
            "categorias": [
                {
                    "id": "65776",
                    "nombre": "Bala",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.256",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hilook_by_hikvision.png",
            "link": "/producto/THC-B120-PC-HiLook-by-HIKVISION-162409.html",
            "imagen_360": [
                "360_GRADOS/HILOOKBYHIKVISION/THCB120PC/2021_05_29_05_45"
            ],
            "iconos": {
                "sup_izq": "https://ftp3.syscom.mx/usuarios/fotos/t_4.png?v=1542849766"
            },
            "peso": "0.24",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "8",
            "largo": "16",
            "ancho": "10",
            "precios": {
                "precio_1": "21.66",
                "precio_especial": "16.48",
                "precio_descuento": "9.49",
                "volumen": {
                    "5": "9.39",
                    "15": "9.30",
                    "50": "9.20"
                },
                "precio_lista": "21.66"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "221952",
            "modelo": "DS-2CD1323G2-LIU",
            "total_existencia": 500,
            "titulo": "[Dual Light] Turret IP 2 Megapixel / Lente 2.8 mm / 30 mts IR + 30 mts Luz Blanca / Micrófono Integrado / ACUSENSE Lite / Exterior IP67 / H.265 / PoE / ONVIF",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CD1323G2LIU/DS2CD1323G2LIU-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CD1323G2-LIU-HIKVISION-221952.html",
            "categorias": [
                {
                    "id": "1325",
                    "nombre": "Domo / Eyeball / Turret",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CD1323G2-LIU-HIKVISION-221952.html",
            "imagen_360": [],
            "iconos": [],
            "peso": "1.00",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "-",
            "largo": "-",
            "ancho": "-",
            "precios": {
                "precio_1": "82.50",
                "precio_especial": "80.94",
                "precio_descuento": "51.80",
                "precio_lista": "82.50"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "219216",
            "modelo": "DVR-216U-M2(C)",
            "total_existencia": 425,
            "titulo": "DVR  16 Canales TurboHD + 16 Canales IP / 8 Megapíxel (4K) / Audio por Coaxitron / ACUSENSE Lite / 2 Bahías de Disco Duro / H.265+ / Salida en Video en 4K",
            "marca": "HiLook by HIKVISION",
            "garantia": "3 años",
            "sat_key": "46171621",
            "sat_description": "Grabadoras de video o audio de vigilancia",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HILOOKBYHIKVISION/DVR216UM2(C)/DVR216UM2(C)-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DVR-216U-M2%28C%29-HiLook+by+HIKVISION-219216.html",
            "categorias": [
                {
                    "id": "2809",
                    "nombre": "Videograbadoras Analógicas - TurboHD TVI / AHD / CVI",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "4.3433",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hilook_by_hikvision.png",
            "link": "/producto/DVR-216U-M2(C)-HiLook-by-HIKVISION-219216.html",
            "imagen_360": [
                "360_GRADOS/HILOOKBYHIKVISION/DVR216UM2(C)/2023_09_27_09_59"
            ],
            "iconos": [],
            "peso": "3.37",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "39",
            "largo": "44",
            "ancho": "13",
            "precios": {
                "precio_1": "440.00",
                "precio_especial": "390.87",
                "precio_descuento": "225.14",
                "volumen": {
                    "5": "222.88",
                    "10": "220.63",
                    "35": "218.38"
                },
                "precio_lista": "440.00"
            },
            "existencia": {
                "nuevo": 425,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "214937",
            "modelo": "DS-2CE16U0T-ITF",
            "total_existencia": 500,
            "titulo": "Bala TURBOHD 4K (8 Megapixel) / Gran Angular 102° / Lente 2.8 mm / Exterior IP67 / IR EXIR 30 mts / dWDR / Metal",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CE16U0TITF/DS2CE16U0TITF-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CE16U0T-ITF-HIKVISION-214937.html",
            "categorias": [
                {
                    "id": "65776",
                    "nombre": "Bala",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.262912",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CE16U0T-ITF-HIKVISION-214937.html",
            "imagen_360": [
                "360_GRADOS/HIKVISION/DS2CE16U0TITF/2024_10_09_10_02"
            ],
            "iconos": [],
            "peso": "0.34",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "8",
            "largo": "16",
            "ancho": "10",
            "precios": {
                "precio_1": "64.85",
                "precio_especial": "58.22",
                "precio_descuento": "37.26",
                "precio_lista": "64.85"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "197099",
            "modelo": "DS-2CE76D0T-ITMF(C)",
            "total_existencia": 460,
            "titulo": "Domo TURBOHD 2 Megapixel (1080p) / Gran Angular 101° / Lente 2.8 mm / 30 mts IR EXIR / Exterior IP67 / 4 Tecnologías / dWDR",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CE76D0TITMF(C)/DS2CE76D0TITMF(C)-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CE76D0T-ITMF%28C%29-HIKVISION-197099.html",
            "categorias": [
                {
                    "id": "65775",
                    "nombre": "Domo / Eyeball / Turret",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.1444",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CE76D0T-ITMF(C)-HIKVISION-197099.html",
            "imagen_360": [
                "360_GRADOS/HIKVISION/DS2CE76D0TITMF(C)/2022_10_06_10_44"
            ],
            "iconos": [],
            "peso": "0.70",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "8",
            "largo": "10",
            "ancho": "10",
            "precios": {
                "precio_1": "40.50",
                "precio_especial": "34.52",
                "precio_descuento": "22.09",
                "precio_lista": "40.50"
            },
            "existencia": {
                "nuevo": 457,
                "asterisco": {
                    "a": 3,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "221572",
            "modelo": "DS-2CD1063G2-LIU",
            "total_existencia": 500,
            "titulo": "Bala IP 6 Megapixel / Lente 2.8 mm / Dual Light (30 mts IR + 30 mts Luz Blanca) / Micrófono Integrado / ACUSENSE Lite / Exterior IP67 / H.265 / PoE ",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CD1063G2LIU/DS2CD1063G2LIU-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CD1063G2-LIU-HIKVISION-221572.html",
            "categorias": [
                {
                    "id": "1323",
                    "nombre": "Bala",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CD1063G2-LIU-HIKVISION-221572.html",
            "imagen_360": [],
            "iconos": [],
            "peso": "0.28",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "-",
            "largo": "-",
            "ancho": "-",
            "precios": {
                "precio_1": "118.32",
                "precio_especial": "117.96",
                "precio_descuento": "75.49",
                "precio_lista": "118.32"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "208279",
            "modelo": "TAPO-C210",
            "total_existencia": 388,
            "titulo": "Cámara IP Wi-Fi para hogar, 3 megapixel, audio doble vía, visión nocturna, notificación Push, acepta memoria Micro SD de para grabación. ",
            "marca": "TP-LINK",
            "garantia": "3 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/TP-LINK/TAPOC210/TAPOC210-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/TAPO-C210-TP-LINK-208279.html",
            "categorias": [
                {
                    "id": "1326",
                    "nombre": "PTZ",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.493",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/tp-link.png",
            "link": "/producto/TAPO-C210-TP-LINK-208279.html",
            "imagen_360": [],
            "iconos": [],
            "peso": "0.45",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "10",
            "largo": "17",
            "ancho": "15",
            "precios": {
                "precio_1": "50.00",
                "precio_especial": "45.45",
                "precio_descuento": "27.63",
                "precio_lista": "50.00"
            },
            "existencia": {
                "nuevo": 388,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "200221",
            "modelo": "AE-DC4328-K5",
            "total_existencia": 51,
            "titulo": "Cámara de Tablero / Cámara Frontal de 4 Megapixel (2K) y Trasera de 2 Megapixel (1080p) / Entrada de alarma para cambio a cámara de reversa / H.265 /  Pantalla Táctil 3\" / WiFi / G-Sensor / Micrófono y Bocina Integr",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/AEDC4328K5/AEDC4328K5-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/AE-DC4328-K5-HIKVISION-200221.html",
            "categorias": [
                {
                    "id": "65666",
                    "nombre": "Videograbadoras Móviles",
                    "nivel": 3
                },
                {
                    "id": "552",
                    "nombre": "Videograbadoras Móviles y Portátiles",
                    "nivel": 2
                },
                {
                    "id": "27",
                    "nombre": "IoT / GPS / Telemática y Señalización Audiovisual",
                    "nivel": 1
                }
            ],
            "pvol": "0.3",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/AE-DC4328-K5-HIKVISION-200221.html",
            "imagen_360": [
                "360_GRADOS/HIKVISION/AEDC4328K5/2022_03_23_03_05"
            ],
            "iconos": [],
            "peso": "0.18",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "6",
            "largo": "16",
            "ancho": "16",
            "precios": {
                "precio_1": "185.30",
                "precio_especial": "163.83",
                "precio_descuento": "102.22",
                "precio_lista": "185.30"
            },
            "existencia": {
                "nuevo": 51,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "61107",
            "modelo": "PS-12-DC-4C",
            "total_existencia": 500,
            "titulo": "Fuente de Alimentación de 4 Salidas de 11 - 15 Vcc / 5 Amper /  Voltaje de Entrada 110- 240 Vac / Fusible Termico PTC Integrado para Protección / Salida de Voltaje Inteligente hasta 3 Amper por Salida",
            "marca": "EPCOM POWERLINE",
            "garantia": "3 años",
            "sat_key": "39121009",
            "sat_description": "Reguladores el?ctricos o de potencia",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/kfranco/PS12DC4C/PS12DC4Cdet.jpg",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/PS-12-DC-4C-EPCOM+POWERLINE-61107.html",
            "categorias": [
                {
                    "id": "2975",
                    "nombre": "Fuentes de Alimentación",
                    "nivel": 3
                },
                {
                    "id": "208",
                    "nombre": "Energía",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.1485",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/epcom_powerline.png",
            "link": "/producto/PS-12-DC-4C-EPCOM-POWERLINE-61107.html",
            "imagen_360": [
                "360_GRADOS/EPCOMPOWERLINE/PS12DC4C/2021_06_11_06_31"
            ],
            "iconos": [],
            "peso": "0.39",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "5",
            "largo": "17",
            "ancho": "10",
            "precios": {
                "precio_1": "18.26",
                "precio_especial": "14.60",
                "precio_descuento": "9.34",
                "volumen": {
                    "10": "9.15",
                    "25": "8.87"
                },
                "precio_lista": "18.26"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "218234",
            "modelo": "DS-2CD1123G2-LIU(F)",
            "total_existencia": 121,
            "titulo": "[Dual Light] Domo IP 2 Megapixel / Lente 2.8 mm / 30 mts IR + 30 mts Luz Blanca / Micrófono Integrado / Antivandálico IK08 / ACUSENSE Lite / Exterior IP67 / H.265 / PoE / ONVIF / Micro SD",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CD1123G2LIU(F)/DS2CD1123G2LIU(F)-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CD1123G2-LIU%28F%29-HIKVISION-218234.html",
            "categorias": [
                {
                    "id": "1325",
                    "nombre": "Domo / Eyeball / Turret",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.61681",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CD1123G2-LIU(F)-HIKVISION-218234.html",
            "imagen_360": [],
            "iconos": [],
            "peso": "0.28",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "12",
            "largo": "22",
            "ancho": "12",
            "precios": {
                "precio_1": "98.48",
                "precio_especial": "97.68",
                "precio_descuento": "62.51",
                "precio_lista": "98.48"
            },
            "existencia": {
                "nuevo": 121,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "215586",
            "modelo": "XMR401NHDSKIT",
            "total_existencia": 117,
            "titulo": "KIT DVR PARA VEHICULO /  INCLUYE /  CÁMARAS PARA INTERIOR /  CÁMARA PARA EXTERIOR, / 2MP AHD /  CABLES EXTENSORES / ADAPTADOR LAN.",
            "marca": "EPCOM",
            "garantia": "5 años",
            "sat_key": "46171621",
            "sat_description": "Grabadoras de video o audio de vigilancia",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/EPCOM/XMR401NHDSKIT/XMR401NHDSKIT-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/XMR401NHDSKIT-EPCOM-215586.html",
            "categorias": [
                {
                    "id": "2910",
                    "nombre": "Móviles (Para Vehículos)",
                    "nivel": 3
                },
                {
                    "id": "219",
                    "nombre": "Kits- Sistemas Completos",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/epcom.png",
            "link": "/producto/XMR401NHDSKIT-EPCOM-215586.html",
            "proyecto": true,
            "imagen_360": [],
            "iconos": [],
            "peso": "2.00",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "-",
            "largo": "-",
            "ancho": "-",
            "precios": {
                "precio_1": "829.49",
                "precio_especial": "756.52",
                "precio_descuento": "484.17",
                "precio_lista": "829.49"
            },
            "existencia": {
                "nuevo": 117,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "233333",
            "modelo": "DVR-208Q-M1(E)",
            "total_existencia": 500,
            "titulo": "DVR 8 Canales TURBOHD + 4 Canales IP / 5 Megapíxel Lite - 3K Lite / Audio por Coaxitron / ACUSENSE Lite / 1 Bahía de Disco Duro / H.265+ / Salida en Full HD",
            "marca": "HiLook by HIKVISION",
            "garantia": "3 años",
            "sat_key": "46171621",
            "sat_description": "Grabadoras de video o audio de vigilancia",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HILOOKBYHIKVISION/DVR208QM1(E)/DVR208QM1(E)-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DVR-208Q-M1%28E%29-HiLook+by+HIKVISION-233333.html",
            "categorias": [
                {
                    "id": "2809",
                    "nombre": "Videograbadoras Analógicas - TurboHD TVI / AHD / CVI",
                    "nivel": 3
                },
                {
                    "id": "476",
                    "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "1.76",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hilook_by_hikvision.png",
            "link": "/producto/DVR-208Q-M1(E)-HiLook-by-HIKVISION-233333.html",
            "imagen_360": [],
            "iconos": [],
            "peso": "1.47",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "8",
            "largo": "40",
            "ancho": "28",
            "precios": {
                "precio_1": "107.50",
                "precio_especial": "102.63",
                "precio_descuento": "59.11",
                "volumen": {
                    "5": "58.52",
                    "10": "57.93",
                    "35": "57.34"
                },
                "precio_lista": "107.50"
            },
            "existencia": {
                "nuevo": 500,
                "asterisco": {
                    "a": 0,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        },
        {
            "producto_id": "222071",
            "modelo": "DS-2CD1343G2-LIUF",
            "total_existencia": 167,
            "titulo": "[Dual Light] Turret IP 4 Megapixel / Lente 2.8 mm / 30 mts IR + 30 mts Luz Blanca / Micrófono Integrado / ACUSENSE Lite / Exterior IP67 / H.265 / PoE / ONVIF / Micro SD",
            "marca": "HIKVISION",
            "garantia": "5 años",
            "sat_key": "46171610",
            "sat_description": "C?maras de seguridad",
            "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/HIKVISION/DS2CD1343G2LIUF/DS2CD1343G2LIUF-p.PNG",
            "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/DS-2CD1343G2-LIUF-HIKVISION-222071.html",
            "categorias": [
                {
                    "id": "1325",
                    "nombre": "Domo / Eyeball / Turret",
                    "nivel": 3
                },
                {
                    "id": "214",
                    "nombre": "Cámaras IP y NVRs",
                    "nivel": 2
                },
                {
                    "id": "22",
                    "nombre": "Videovigilancia",
                    "nivel": 1
                }
            ],
            "pvol": "0.61681",
            "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
            "link": "/producto/DS-2CD1343G2-LIUF-HIKVISION-222071.html",
            "imagen_360": [
                "360_GRADOS/HIKVISION/DS2CD1343G2LIUF/2025_04_11_04_46"
            ],
            "iconos": [],
            "peso": "0.28",
            "unidad_de_medida": {
                "codigo_unidad": "1",
                "nombre": "Pieza",
                "clave_unidad_sat": "H87"
            },
            "alto": "12",
            "largo": "22",
            "ancho": "12",
            "precios": {
                "precio_1": "128.50",
                "precio_especial": "111.47",
                "precio_descuento": "71.34",
                "precio_lista": "128.50"
            },
            "existencia": {
                "nuevo": 166,
                "asterisco": {
                    "a": 1,
                    "b": 0,
                    "c": 0,
                    "d": 0
                },
                "detalle": []
            }
        }
    ],
    "todo": false
}
Api producto información 
https://developers.syscom.mx/api/v1/productos/208098
resultado
{
    "producto_id": "208098",
    "modelo": "B8-TURBO-G2P",
    "total_existencia": 500,
    "titulo": "Bala TURBOHD 2 Megapíxeles (1080p) / Gran Angular 103° / Lente 2.8 mm / IR EXIR Inteligente 20 mts / Exterior IP66 / dWDR / TVI-AHD-CVI-CVBS / Policarbonato",
    "marca": "EPCOM PROFESSIONAL",
    "garantia": "5 años",
    "sat_key": "46171610",
    "sat_description": "C?maras de seguridad",
    "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/EPCOM/B8TURBOG2P/B8TURBOG2P-p.PNG",
    "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/B8-TURBO-G2P-EPCOM+PROFESSIONAL-208098.html",
    "categorias": [
        {
            "id": "65776",
            "nombre": "Bala",
            "nivel": 3
        },
        {
            "id": "476",
            "nombre": "Cámaras y DVRs HD TurboHD / AHD / HD-TVI",
            "nivel": 2
        },
        {
            "id": "22",
            "nombre": "Videovigilancia",
            "nivel": 1
        }
    ],
    "pvol": "0.256",
    "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/epcom_professional.png",
    "link": "/producto/B8-TURBO-G2P-EPCOM-PROFESSIONAL-208098.html",
    "descripcion": "<p style='text-align: center;'><img class='fr-fic fr-dii' style='width: 100%;' src='http://ftp3.syscom.mx/usuarios/emendoza/elesbanmch/HIKVISON/IMAGENES/epcom.png' height='100%' /><img class='fr-fic fr-dii' style='width: 20%;' src='http://ftp3.syscom.mx/usuarios/anavarrete/Noe/imagen1.png' /></p><p>&nbsp;</p><div class='row'><div class='col-sm-6'><div style='border-left: 5px solid #0091ff; border-radius: 5px; padding: 5px; box-shadow: 2px 2px 10px #d8d8d8; -webkit-box-shadow: 2px 2px 10px #d8d8d8;'><span style='font-family: verdana, geneva, sans-serif;'><strong>Caracter&iacute;sticas principales:</strong></span><ul><li><span style='font-family: verdana, geneva, sans-serif;'>Resoluci&oacute;n m&aacute;xima: 1920 x 1080 ( 2 Megapixel)&nbsp;</span></li><li><span style='font-family: verdana, geneva, sans-serif;'>Iluminaci&oacute;n m&iacute;nima: 0.01 Lux @ (F1.2, AGC ON), 0 Lux con IR.</span></li><li><span style='font-family: verdana, geneva, sans-serif;'>Lente fijo: 2.8 mm (&aacute;ngulo de apertura 103&ordm;).</span></li><li><span style='font-family: verdana, geneva, sans-serif;'>20 mts IR EXIR (visi&oacute;n nocturna).</span></li><li><span style='font-family: verdana, geneva, sans-serif;'>Soporta 4 tecnolog&iacute;as seleccionables (TVI / AHD / CVI / CVBS).</span></li><li><span style='font-family: verdana, geneva, sans-serif;'>Funciones: dWDR / BLC / AGC.</span></li><li><span style='font-family: verdana, geneva, sans-serif;'>Soporta coaxitron (video + menu OSD). No soporta micr&oacute;fono integrado.&nbsp;</span></li></ul></div></div><div class='col-sm-6'><div style='border-left: 5px solid #0091ff; border-radius: 5px; padding: 5px; box-shadow: 2px 2px 10px #d8d8d8; -webkit-box-shadow: 2px 2px 10px #d8d8d8;'><span style='font-family: verdana, geneva, sans-serif;'><strong>Caracter&iacute;sticas F&iacute;sicas y El&eacute;ctricas:</strong></span><ul><li><span style='font-family: verdana, geneva, sans-serif;'>Temperatura de operaci&oacute;n: -40&ordm;C a 60&ordm;C.</span></li><li><span style='font-family: verdana, geneva, sans-serif;'>Alimentaci&oacute;n: 12 Vcc / 4 Watts.</span></li><li><span style='font-family: verdana, geneva, sans-serif;'>Protecci&oacute;n: Interior / Exterior IP66.</span></li><li><span style='font-family: verdana, geneva, sans-serif;'>Fabricado en material de policarbonato.</span></li><li><span style='font-family: verdana, geneva, sans-serif;'>Dimensiones: 189.2 x 65.9 x 81.8 mm.</span></li><li><span style='font-family: verdana, geneva, sans-serif;'>Peso: 400 grs.</span></li></ul></div></div></div><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>",
    "imagen_360": [
        "360_GRADOS/EPCOMPROFESSIONAL/B8TURBOG2P/2023_06_20_06_24"
    ],
    "iconos": {
        "sup_izq": "https://ftp3.syscom.mx/usuarios/ftp/syscom_mx/3-12-50-5-5anÌƒos-de-garantia.png",
        "sup_der": "https://ftp3.syscom.mx/usuarios/ftp/syscom_mx/3-16-21-24-poli.png",
        "inf_der": "https://ftp3.syscom.mx/usuarios/ftp/syscom_mx/3-16-24-37-103-vision.png"
    },
    "peso": "0.24",
    "unidad_de_medida": {
        "codigo_unidad": "1",
        "nombre": "Pieza",
        "clave_unidad_sat": "H87"
    },
    "alto": "8",
    "largo": "16",
    "ancho": "10",
    "precios": {
        "precio_1": "20.70",
        "precio_especial": "18.59",
        "precio_descuento": "11.60",
        "volumen": {
            "50": "11.36",
            "100": "11.25",
            "150": "11.13"
        },
        "precio_lista": "20.70"
    },
    "existencia": {
        "nuevo": 500,
        "asterisco": {
            "a": 0,
            "b": 0,
            "c": 0,
            "d": 0
        },
        "detalle": []
    },
    "caracteristicas": [
        "Resolución máxima de 1920 x 1080 píxeles",
        "Visión nocturna IR hasta 20 metros",
        "4 tecnologías seleccionables: TVI, AHD, CVI, CVBS",
        "Protección IP66 para uso exterior",
        "Temperatura operativa de -40°C a 60°C"
    ],
    "imagenes": [
        {
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/EPCOM/B8TURBOG2P/B8TURBOG2P-p.PNG",
            "orden": "0"
        },
        {
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/EPCOMPROFESSIONAL/B8TURBOG2P/B8TURBOG2P-AD-1-p.PNG",
            "orden": "1"
        },
        {
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/EPCOMPROFESSIONAL/B8TURBOG2P/B8TURBOG2P-AD-2-p.PNG",
            "orden": "2"
        },
        {
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/EPCOMPROFESSIONAL/B8TURBOG2P/B8TURBOG2P-AD-3-p.PNG",
            "orden": "3"
        },
        {
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/EPCOMPROFESSIONAL/B8TURBOG2P/B8TURBOG2P-AD-4-p.PNG",
            "orden": "4"
        },
        {
            "imagen": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/EPCOMPROFESSIONAL/B8TURBOG2P/B8TURBOG2P-AD-5-p.PNG",
            "orden": "5"
        }
    ],
    "recursos": [
        {
            "recurso": "Especificaciones Técnicas B8-TURBO-G2W",
            "path": "https://ftp3.syscom.mx/usuarios/fcarrillo/Hikvision/Specs/Especificaciones%20Tecnicas%20B8-TURBO-G2W.pdf"
        }
    ]
}
Api producto relacionado 
https://developers.syscom.mx/api/v1/productos/163327/relacionados
resultado
[
    {
        "producto_id": "69463",
        "modelo": "XB-275",
        "total_existencia": 29,
        "titulo": "Pilona o Bolardo Neumático / 100% Acero Inoxidable / Alta Velocidad / 275MM Diámetro / Acabado de Lujo",
        "marca": "ACCESSPRO",
        "garantia": "3 años",
        "sat_key": "46171619",
        "sat_description": "Sistemas de seguridad o de control de acceso",
        "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/ACCESSPROINDUSTRIAL/XB275/XB275-p.PNG",
        "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/XB-275-ACCESSPRO-69463.html",
        "categorias": [
            {
                "id": "2938",
                "nombre": "Pilonas o Bolardos",
                "nivel": 3
            },
            {
                "id": "499",
                "nombre": "Acceso Vehicular",
                "nivel": 2
            },
            {
                "id": "37",
                "nombre": "Control  de Acceso ",
                "nivel": 1
            }
        ],
        "pvol": "66000",
        "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/accesspro.png",
        "link": "/producto/XB-275-ACCESSPRO-69463.html",
        "imagen_360": [],
        "iconos": {
            "sup_der": "https://ftp3.syscom.mx/usuarios/fotos/diametro.png"
        },
        "peso": "190.00",
        "unidad_de_medida": {
            "codigo_unidad": "1",
            "nombre": "Pieza",
            "clave_unidad_sat": "H87"
        },
        "alto": "500",
        "largo": "1100",
        "ancho": "600",
        "precios": [],
        "nota": "SOLICITAR DISTRIBUCIÓN",
        "existencia": {
            "nuevo": 29,
            "asterisco": {
                "a": 0,
                "b": 0,
                "c": 0,
                "d": 0
            },
            "detalle": []
        }
    },
    {
        "producto_id": "69464",
        "modelo": "X-CONTROL-BOX",
        "total_existencia": 36,
        "titulo": "Sistema de Control Para 4 Bolardos Neumáticos Simultáneamente ",
        "marca": "ACCESSPRO",
        "garantia": "3 años",
        "sat_key": "46171619",
        "sat_description": "Sistemas de seguridad o de control de acceso",
        "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/ACCESSPRO/XCONTROLBOX/XCONTROLBOX-p.PNG",
        "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/X-CONTROL-BOX-ACCESSPRO-69464.html",
        "categorias": [
            {
                "id": "2938",
                "nombre": "Pilonas o Bolardos",
                "nivel": 3
            },
            {
                "id": "499",
                "nombre": "Acceso Vehicular",
                "nivel": 2
            },
            {
                "id": "37",
                "nombre": "Control  de Acceso ",
                "nivel": 1
            }
        ],
        "pvol": "126350",
        "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/accesspro.png",
        "link": "/producto/X-CONTROL-BOX-ACCESSPRO-69464.html",
        "imagen_360": [],
        "iconos": [],
        "peso": "130.00",
        "unidad_de_medida": {
            "codigo_unidad": "1",
            "nombre": "Pieza",
            "clave_unidad_sat": "H87"
        },
        "alto": "950",
        "largo": "950",
        "ancho": "700",
        "precios": [],
        "nota": "SOLICITAR DISTRIBUCIÓN",
        "existencia": {
            "nuevo": 36,
            "asterisco": {
                "a": 0,
                "b": 0,
                "c": 0,
                "d": 0
            },
            "detalle": []
        }
    },
    {
        "producto_id": "70020",
        "modelo": "PRORELAY",
        "total_existencia": 500,
        "titulo": "Módulo de Relevador",
        "marca": "ACCESSPRO",
        "garantia": "3 años",
        "sat_key": "32101617",
        "sat_description": "Tarjetas inteligentes",
        "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/ACCESSPRO/PRORELAY/PRORELAY-p.PNG",
        "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/PRORELAY-ACCESSPRO-70020.html",
        "categorias": [
            {
                "id": "2939",
                "nombre": "Tarjetas de Relevador",
                "nivel": 3
            },
            {
                "id": "415",
                "nombre": "Accesorios",
                "nivel": 2
            },
            {
                "id": "37",
                "nombre": "Control  de Acceso ",
                "nivel": 1
            }
        ],
        "pvol": "0.0002",
        "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/accesspro.png",
        "link": "/producto/PRORELAY-ACCESSPRO-70020.html",
        "imagen_360": [
            "360_GRADOS/ACCESSPRO/PRORELAY/2022_03_23_03_09"
        ],
        "iconos": [],
        "peso": "0.01",
        "unidad_de_medida": {
            "codigo_unidad": "1",
            "nombre": "Pieza",
            "clave_unidad_sat": "H87"
        },
        "alto": "1",
        "largo": "1",
        "ancho": "1",
        "precios": {
            "precio_1": "3.89",
            "precio_especial": "3.21",
            "precio_descuento": "2.05",
            "precio_lista": "3.89"
        },
        "existencia": {
            "nuevo": 500,
            "asterisco": {
                "a": 0,
                "b": 0,
                "c": 0,
                "d": 0
            },
            "detalle": []
        }
    },
    {
        "producto_id": "72079",
        "modelo": "009-MXARM001",
        "total_existencia": 66,
        "titulo": "Refacción / Mástil de 4 M / Aluminio / Compatible con KXBGGALED/KXBGG4LED/KXBGG4M / Tiras LED no incluídas",
        "marca": "CAME",
        "garantia": "3 años",
        "sat_key": "46171619",
        "sat_description": "Sistemas de seguridad o de control de acceso",
        "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/CAME/009MXARM001/009MXARM001-p.PNG",
        "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/009-MXARM001-CAME-72079.html",
        "categorias": [
            {
                "id": "66066",
                "nombre": "Refacciones",
                "nivel": 3
            },
            {
                "id": "499",
                "nombre": "Acceso Vehicular",
                "nivel": 2
            },
            {
                "id": "37",
                "nombre": "Control  de Acceso ",
                "nivel": 1
            }
        ],
        "pvol": "6.804",
        "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/came.png",
        "link": "/producto/009-MXARM001-CAME-72079.html",
        "imagen_360": [],
        "iconos": [],
        "peso": "4.80",
        "unidad_de_medida": {
            "codigo_unidad": "1",
            "nombre": "Pieza",
            "clave_unidad_sat": "H87"
        },
        "alto": "9",
        "largo": "9",
        "ancho": "420",
        "precios": {
            "precio_1": "180.11",
            "precio_especial": "180.11",
            "precio_descuento": "115.27",
            "precio_lista": "180.11"
        },
        "existencia": {
            "nuevo": 61,
            "asterisco": {
                "a": 0,
                "b": 4,
                "c": 1,
                "d": 0
            },
            "detalle": []
        }
    },
    {
        "producto_id": "73667",
        "modelo": "XT-100-C",
        "total_existencia": 12,
        "titulo": "Torniquete Sencillo / Cuerpo Completo / Interior/Exterior / 100% Acero con Pintura Gris / EJE CENTRAL con Pintura Gris / Acabado de Lujo / Alto Tráfico",
        "marca": "ACCESSPRO",
        "garantia": "3 años",
        "sat_key": "46171619",
        "sat_description": "Sistemas de seguridad o de control de acceso",
        "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/ACCESSPRO/XT100C/portada_0S400.PNG",
        "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/XT-100-C-ACCESSPRO-73667.html",
        "categorias": [
            {
                "id": "66062",
                "nombre": "Torniquetes de Cuerpo Completo",
                "nivel": 3
            },
            {
                "id": "66061",
                "nombre": "Torniquetes y Puertas de Cortesía",
                "nivel": 2
            },
            {
                "id": "37",
                "nombre": "Control  de Acceso ",
                "nivel": 1
            }
        ],
        "pvol": "914.4",
        "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/accesspro.png",
        "link": "/producto/XT-100-C-ACCESSPRO-73667.html",
        "imagen_360": [],
        "iconos": {
            "sup_der": "https://ftp3.syscom.mx/usuarios/fotos/3-garantia-1.png"
        },
        "peso": "466.00",
        "unidad_de_medida": {
            "codigo_unidad": "1",
            "nombre": "Pieza",
            "clave_unidad_sat": "H87"
        },
        "alto": "150",
        "largo": "240",
        "ancho": "127",
        "precios": [],
        "nota": "SOLICITAR DISTRIBUCIÓN",
        "existencia": {
            "nuevo": 11,
            "asterisco": {
                "a": 0,
                "b": 1,
                "c": 0,
                "d": 0
            },
            "detalle": []
        }
    },
    {
        "producto_id": "78539",
        "modelo": "XB-REC2",
        "total_existencia": 496,
        "titulo": "Receptor Inalámbrico Externo de 2 Canales Para Controles AccessPRO /  Soporta Hasta 400 Controles de Un Botón",
        "marca": "ACCESSPRO",
        "garantia": "1 años",
        "sat_key": "46171619",
        "sat_description": "Sistemas de seguridad o de control de acceso",
        "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/ACCESSPRO/XBREC2/XBREC2-p.PNG",
        "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/XB-REC2-ACCESSPRO-78539.html",
        "categorias": [
            {
                "id": "2527",
                "nombre": "Controles Inalámbricos",
                "nivel": 3
            },
            {
                "id": "415",
                "nombre": "Accesorios",
                "nivel": 2
            },
            {
                "id": "37",
                "nombre": "Control  de Acceso ",
                "nivel": 1
            }
        ],
        "pvol": "0.04557",
        "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/accesspro.png",
        "link": "/producto/XB-REC2-ACCESSPRO-78539.html",
        "imagen_360": [],
        "iconos": [],
        "peso": "0.10",
        "unidad_de_medida": {
            "codigo_unidad": "1",
            "nombre": "Pieza",
            "clave_unidad_sat": "H87"
        },
        "alto": "4",
        "largo": "11",
        "ancho": "6",
        "precios": {
            "precio_1": "21.30",
            "precio_especial": "21.30",
            "precio_descuento": "13.63",
            "precio_lista": "21.30"
        },
        "existencia": {
            "nuevo": 496,
            "asterisco": {
                "a": 0,
                "b": 0,
                "c": 0,
                "d": 0
            },
            "detalle": []
        }
    },
    {
        "producto_id": "78542",
        "modelo": "XBS-SW-01",
        "total_existencia": 501,
        "titulo": "Botonera Triple de USO RUDO Para Barreras Vehiculares, Operadores Corredizos y Abatibles. ",
        "marca": "ACCESSPRO",
        "garantia": "3 años",
        "sat_key": "46171619",
        "sat_description": "Sistemas de seguridad o de control de acceso",
        "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/XBSSW01/XBSSW01.jpg",
        "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/XBS-SW-01-ACCESSPRO-78542.html",
        "categorias": [
            {
                "id": "2884",
                "nombre": "Botones de Salida",
                "nivel": 3
            },
            {
                "id": "415",
                "nombre": "Accesorios",
                "nivel": 2
            },
            {
                "id": "37",
                "nombre": "Control  de Acceso ",
                "nivel": 1
            }
        ],
        "pvol": "0.0020952",
        "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/accesspro.png",
        "link": "/producto/XBS-SW-01-ACCESSPRO-78542.html",
        "imagen_360": [
            "360_GRADOS/ACCESSPRO/XBSSW01/2021_10_18_10_39"
        ],
        "iconos": [],
        "peso": "0.28",
        "unidad_de_medida": {
            "codigo_unidad": "1",
            "nombre": "Pieza",
            "clave_unidad_sat": "H87"
        },
        "alto": "1",
        "largo": "1",
        "ancho": "18",
        "precios": [],
        "nota": "SOLICITAR DISTRIBUCIÓN",
        "existencia": {
            "nuevo": 500,
            "asterisco": {
                "a": 1,
                "b": 0,
                "c": 0,
                "d": 0
            },
            "detalle": []
        }
    }
]

Api Productos accesorios
https://developers.syscom.mx/api/v1/productos/163327/accesorios
resultado
[
    {
        "producto_id": "69464",
        "modelo": "X-CONTROL-BOX",
        "total_existencia": 36,
        "titulo": "Sistema de Control Para 4 Bolardos Neumáticos Simultáneamente ",
        "marca": "ACCESSPRO",
        "garantia": "3 años",
        "sat_key": "46171619",
        "sat_description": "Sistemas de seguridad o de control de acceso",
        "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/ACCESSPRO/XCONTROLBOX/XCONTROLBOX-p.PNG",
        "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/X-CONTROL-BOX-ACCESSPRO-69464.html",
        "categorias": [
            {
                "id": "2938",
                "nombre": "Pilonas o Bolardos",
                "nivel": 3
            },
            {
                "id": "499",
                "nombre": "Acceso Vehicular",
                "nivel": 2
            },
            {
                "id": "37",
                "nombre": "Control  de Acceso ",
                "nivel": 1
            }
        ],
        "pvol": "126350",
        "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/accesspro.png",
        "link": "/producto/X-CONTROL-BOX-ACCESSPRO-69464.html",
        "imagen_360": [],
        "iconos": [],
        "peso": "130.00",
        "unidad_de_medida": {
            "codigo_unidad": "1",
            "nombre": "Pieza",
            "clave_unidad_sat": "H87"
        },
        "alto": "950",
        "largo": "950",
        "ancho": "700",
        "precios": [],
        "nota": "SOLICITAR DISTRIBUCIÓN",
        "existencia": {
            "nuevo": 36,
            "asterisco": {
                "a": 0,
                "b": 0,
                "c": 0,
                "d": 0
            },
            "detalle": []
        }
    },
    {
        "producto_id": "78542",
        "modelo": "XBS-SW-01",
        "total_existencia": 501,
        "titulo": "Botonera Triple de USO RUDO Para Barreras Vehiculares, Operadores Corredizos y Abatibles. ",
        "marca": "ACCESSPRO",
        "garantia": "3 años",
        "sat_key": "46171619",
        "sat_description": "Sistemas de seguridad o de control de acceso",
        "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/XBSSW01/XBSSW01.jpg",
        "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/XBS-SW-01-ACCESSPRO-78542.html",
        "categorias": [
            {
                "id": "2884",
                "nombre": "Botones de Salida",
                "nivel": 3
            },
            {
                "id": "415",
                "nombre": "Accesorios",
                "nivel": 2
            },
            {
                "id": "37",
                "nombre": "Control  de Acceso ",
                "nivel": 1
            }
        ],
        "pvol": "0.0020952",
        "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/accesspro.png",
        "link": "/producto/XBS-SW-01-ACCESSPRO-78542.html",
        "imagen_360": [
            "360_GRADOS/ACCESSPRO/XBSSW01/2021_10_18_10_39"
        ],
        "iconos": [],
        "peso": "0.28",
        "unidad_de_medida": {
            "codigo_unidad": "1",
            "nombre": "Pieza",
            "clave_unidad_sat": "H87"
        },
        "alto": "1",
        "largo": "1",
        "ancho": "18",
        "precios": [],
        "nota": "SOLICITAR DISTRIBUCIÓN",
        "existencia": {
            "nuevo": 500,
            "asterisco": {
                "a": 1,
                "b": 0,
                "c": 0,
                "d": 0
            },
            "detalle": []
        }
    },
    {
        "producto_id": "161288",
        "modelo": "XBS-RR16",
        "total_existencia": 501,
        "titulo": "Detector fotoeléctrico de 16 m de alcance / Luz indicadora para alineación ",
        "marca": "AccessPRO",
        "garantia": "3 años",
        "sat_key": "46171619",
        "sat_description": "Sistemas de seguridad o de control de acceso",
        "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/ACCESSPRO/XBSRR16/XBSRR16-p.PNG",
        "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/XBS-RR16-AccessPRO-161288.html",
        "categorias": [
            {
                "id": "2926",
                "nombre": "Accesorios ",
                "nivel": 3
            },
            {
                "id": "499",
                "nombre": "Acceso Vehicular",
                "nivel": 2
            },
            {
                "id": "37",
                "nombre": "Control  de Acceso ",
                "nivel": 1
            }
        ],
        "pvol": "0.2304",
        "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/accesspro.png",
        "link": "/producto/XBS-RR16-AccessPRO-161288.html",
        "imagen_360": [
            "360_GRADOS/ACCESSPRO/XBSRR16/2021_12_16_12_58"
        ],
        "iconos": [],
        "peso": "0.15",
        "unidad_de_medida": {
            "codigo_unidad": "1",
            "nombre": "Pieza",
            "clave_unidad_sat": "H87"
        },
        "alto": "6",
        "largo": "16",
        "ancho": "12",
        "precios": {
            "precio_1": "50.72",
            "precio_especial": "50.72",
            "precio_descuento": "32.46",
            "precio_lista": "50.72"
        },
        "existencia": {
            "nuevo": 500,
            "asterisco": {
                "a": 1,
                "b": 0,
                "c": 0,
                "d": 0
            },
            "detalle": []
        }
    },
    {
        "producto_id": "136647",
        "modelo": "ESIM320IP",
        "total_existencia": 0,
        "titulo": "Controlador Remoto 3G con Activación vía APP o Llamada | Caja Nema IP67 | Soporta hasta 2000 Usuarios",
        "marca": "ELDES",
        "garantia": "3 años",
        "sat_key": "43223100",
        "sat_description": "Componentes y equipo de infraestructura de redes m?viles y digitales",
        "img_portada": "https://ftp3.syscom.mx/usuarios/fotos/BancoFotografiasSyscom/ELDES/ESIM320IP/ESIM320IP-p.PNG",
        "link_privado": "https://www.productos-info.com/s/syscom/es/87088/8f1afc36a2dece990868f6fe49bd4347/x/-MX$/ESIM320IP-ELDES-136647.html",
        "categorias": [
            {
                "id": "2527",
                "nombre": "Controles Inalámbricos",
                "nivel": 3
            },
            {
                "id": "415",
                "nombre": "Accesorios",
                "nivel": 2
            },
            {
                "id": "37",
                "nombre": "Control  de Acceso ",
                "nivel": 1
            }
        ],
        "pvol": "0.1188",
        "marca_logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/eldes.png",
        "link": "/producto/ESIM320IP-ELDES-136647.html",
        "imagen_360": [
            "360_GRADOS/ELDES/ESIM320IP/2021_09_06_09_29"
        ],
        "iconos": [],
        "peso": "0.42",
        "unidad_de_medida": {
            "codigo_unidad": "1",
            "nombre": "Pieza",
            "clave_unidad_sat": "H87"
        },
        "alto": "9",
        "largo": "12",
        "ancho": "6",
        "precios": {
            "precio_1": "255.74",
            "precio_especial": "255.74",
            "precio_descuento": "163.67",
            "precio_lista": "255.74"
        },
        "existencia": {
            "nuevo": 0,
            "asterisco": {
                "a": 0,
                "b": 0,
                "c": 0,
                "d": 0
            },
            "detalle": []
        }
    }
]
Api tipo se cambio
https://developers.syscom.mx/api/v1/tipocambio
resultado 
{
    "normal": "17.85",
    "preferencial": "17.85",
    "un_dia": "17.90",
    "una_semana": "17.95",
    "dos_semanas": "18.00",
    "tres_semanas": "18.05",
    "un_mes": "18.10"
}





