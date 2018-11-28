 
// State lists
var states = new Array();
 
states['Alemania'] = new Array('Bavaria', 'Berlin','Schleswig Holstein');
states['Canada'] = new Array('Alberta','British Columbia','Ontario');
states['Mexico'] = new Array('Guanajuato','Puebla','Jalisco');
states['Estados Unidos'] = new Array('California','Florida','New York');
 
 
// City lists
var cities = new Array();
 
cities['Canada'] = new Array();
cities['Canada']['Alberta'] = new Array('Airdrie', 'Brooks', 'Calgary',
													             'Edmonton', 'Leduc', 'Lethbridge',
													             'Red Deer', 'St. Albert', 'Wetaskiwin');
cities['Canada']['British Columbia'] = new Array('Abbotsford', 'Armstrong', 'Burnaby',
                                                'Langford', 'Langley', 'Maple Ridge',
													                       'Vancouver', 'Victoria', 'White Rock');
cities['Canada']['Ontario'] = new Array('Barrie', 'Belleville', 'Brampton',
													             'Hamilton', 'Kawartha Lakes', 'Kenora',
													             'Toronto', 'Waterloo', 'Windsor');
 
cities['Alemania'] = new Array();
cities['Alemania']['Bavaria'] = new Array('Augsburg', 'Erlangen', 'Furth', 
											                   'Ingolstadt', 'Munchen', 'Nuremberg', 
											                   'Oberhaching', 'Regensburg', 'Wurzburg');
cities['Alemania']['Berlin'] = new Array('Adlershof', 'Berlin', 'Colonie Alsen',
										                    'Marzahn', 'Nordend', 'Ortsteil',
										                    'Weissensee', 'X-Berg', 'Zwiebusch');
cities['Alemania']['Schleswig Holstein'] = new Array('Kiel', 'Lubeck', 'Neumunster');

cities['Mexico'] = new Array();
cities['Mexico']['Guanajuato'] = new Array('Abasolo', 'Acambaro', 'Celaya',
											                     'Guanajuato', 'Irapuato', 'Leon',
											                     'Villagran', 'Xichu', 'Yuriria');
cities['Mexico']['Puebla'] = new Array('Acajete', 'Ahuatlan', 'Cholula',
											                 'Plaxtla', 'Puebla',  'Quecholac',
											                 'Zautla', 'Zoquiapan', 'Zoquitlan');
cities['Mexico']['Jalisco'] = new Array('Acatic', 'Acatlan de Juarez', 'Ahualulco de Mercado',
												                'Guadalajara', 'Hostotipaquillo', 'Jalostitlan', 	
												                'Puerto Vallarta', 'Quitupan', 'San Gabriel',
												                'Villa Hidalgo', 'Zapopan', 'Zapotiltic');
 
cities['Estados Unidos'] = new Array();
cities['Estados Unidos']['California'] = new Array('Adelanto', 'Agoura Hills', 'Apple Valley',
													                         'Los Angeles', 'Maywood', 'Menifee',
													                         'San Francisco', 'Sanger', 'Yucca Valley');
cities['Estados Unidos']['Florida']    = new Array('Altha', 'Archer', 'Baldwin',
													                         'Lake Park', 'Miami', 'MontVerde',
													                         'Orlando', 'Rockledge', 'Zolfo Springs');
cities['Estados Unidos']['New York']   = new Array('Albany', 'Amsterdam', 'Buffalo',
													                         'Kingston', 'New York', 'Rye',
													                         'Troy', 'Watertown', 'Yonkers');
 
 
function setStates() {
  cntrySel = document.getElementById('Pais');
  stateList = states[cntrySel.value];
  changeSelect('Estado', stateList, stateList);
  setCities();
}
 
function setCities() {
  cntrySel = document.getElementById('Pais');
  stateSel = document.getElementById('Estado');
  cityList = cities[cntrySel.value][stateSel.value];
  changeSelect('Ciudad', cityList, cityList);
}
 
function changeSelect(fieldID, newOptions, newValues) {
  selectField = document.getElementById(fieldID);
  selectField.options.length = 0;
  for (i=0; i<newOptions.length; i++) {
    selectField.options[selectField.length] = new Option(newOptions[i], newValues[i]);
  }
}
 
function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      if (oldonload) {
        oldonload();
      }
      func();
    }
  }
}
 
addLoadEvent(function() {
  setStates();
});