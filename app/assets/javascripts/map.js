$(function(){

	$('.welcome-div .btn-1').click(function(){
		$('.home-content-wrapper').addClass('chose-region');
	});

	$(".ukraine-map").mapael({
		map : {
			width : 900 ,
			name : "ukraine"
            // Enable zoom on the map
            // , zoom : {
            //     enabled : true
            // }
			// Set default plots and areas style
			, defaultPlot : {
				attrs : {
					fill: "#8ab64a"
					, opacity : 1
				}
				, attrsHover : {
					transform : "s1.2"
				}
				, text : {
					attrs : {
						fill : "#505444"
					}
					, attrsHover : {
						fill : "#000"
					}, position: "top"
				},
				type : "image",
				url: "/assets/i-m-m.png",
				width: 12,
				height: 14,
			}
			, defaultArea: {
				attrs : {
					fill : "#FFFFFF"
					, stroke: "#8ab64a"
					, "stroke-width" : 1
					, animDuration : 0
				}
				, attrsHover : {
					fill: "#8ab64a"
					, animDuration : 0
				}
				, text : {
					attrs : {
						fill : "#505444"
					}
					, attrsHover : {
						fill : "#000"
					}
				}
			}
		},
		
		// Customize some areas of the map
		areas: {
			// "Zhytomyr" : {
			// 	text : {content : "Житомир", attrs : {"font-size" : 10}}, 
			// 	tooltip: {content : "Zhytomyr"},
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Zaporizhia" : {
			// 	text : {content : "Запоріжжя"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Zakarpattia" : {
			// 	text : {content : "Закарпаття"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Volyn" : {
			// 	text : {content : "Волинь"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Vinnytsia" : {
			// 	text : {content : "Вінниця"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Ivano-Frankivsk" : {
			// 	text : {content : "Івано-Франківськ"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Sumy" : {
			// 	text : {content : "Суми"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Sevastopol" : {
			// 	text : {content : "Севастополь"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Rivne" : {
			// 	text : {content : "Рівне"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Ternopil" : {
			// 	text : {content : "Тернопіль"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Poltava" : {
			// 	text : {content : "Полтава"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Odessa" : {
			// 	text : {content : "Одеса"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Mykolaiv" : {
			// 	text : {content : "Миколаїв"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Lviv" : {
			// 	text : {content : "Львів"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Luhansk" : {
			// 	text : {content : "Луганськ"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Kirovohrad" : {
			// 	text : {content : "Кіровоград"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Kiev" : {
			// 	text : {content : "Київ"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Kiev City" : {
			// 	text : {content : "Київ"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Khmelnytskyi" : {
			// 	text : {content : "Хмельницьк"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Kherson" : {
			// 	text : {content : "Херсон"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Kharkiv" : {
			// 	text : {content : "Харків"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Donetsk" : {
			// 	text : {content : "Донецьк"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Dnipropetrovsk" : {
			// 	text : {content : "Дніпропетровськ"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Chernivtsi" : {
			// 	text : {content : "Чернівці"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Chernihiv" : {
			// 	text : {content : "Чернігів"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Cherkasy" : {
			// 	text : {content : "Черкаси"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			// "Crimea" : {
			// 	text : {content : "Крим", attrs : {transform : "t1,1"}},
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// }
		},

		// Add some plots on the map
		plots : {
			"Zhytomyr1" : {
				x: 200,
				y: 100,
				text : {content : "Житомир", attrs : {"font-size" : 10}}, 
				tooltip: {content : "Zhytomyr"},
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Zaporizhia1" : {
				x: 400,
				y: 300,
				text : {content : "Запоріжжя"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Zakarpattia1" : {
				x: 200,
				y: 100,
				text : {content : "Ужгород"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Volyn1" : {
				x: 200,
				y: 100,
				text : {content : "Луцьк"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Vinnytsia1" : {
				x: 200,
				y: 100,
				text : {content : "Вінниця"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Ivano-Frankivsk1" : {
				x: 100,
				y: 190,
				text : {content : "Івано-Франківськ"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Sumy1" : {
				x: 200,
				y: 100,
				text : {content : "Суми"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Sevastopol1" : {
				x: 200,
				y: 100,
				text : {content : "Севастополь"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Rivne1" : {
				x: 200,
				y: 100,
				text : {content : "Рівне"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Ternopil1" : {
				x: 200,
				y: 100,
				text : {content : "Тернопіль"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Poltava1" : {
				x: 200,
				y: 100,
				text : {content : "Полтава"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Odessa1" : {
				x: 200,
				y: 100,
				text : {content : "Одеса"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Mykolaiv1" : {
				x: 200,
				y: 100,
				text : {content : "Миколаїв"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Lviv1" : {
				x: 200,
				y: 100,
				text : {content : "Львів"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Luhansk1" : {
				x: 200,
				y: 100,
				text : {content : "Луганськ"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Kirovohrad1" : {
				x: 200,
				y: 100,
				text : {content : "Кіровоград"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Kiev1" : {
				x: 200,
				y: 100,
				text : {content : "Київ"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			// "Kiev City1" : {
			// 	x: 200,
			// 	y: 100,
			// 	text : {content : "Київ"}, 
			// 	href:"http://en.wikipedia.org/wiki/Ukraine"
			// },
			"Khmelnytskyi1" : {
				x: 200,
				y: 100,
				text : {content : "Хмельницьк"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Kherson1" : {
				x: 200,
				y: 100,
				text : {content : "Херсон"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Kharkiv1" : {
				x: 200,
				y: 100,
				text : {content : "Харків"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Donetsk1" : {
				x: 200,
				y: 100,
				text : {content : "Донецьк"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Dnipropetrovsk1" : {
				x: 200,
				y: 100,
				text : {content : "Дніпропетровськ"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Chernivtsi1" : {
				x: 200,
				y: 100,
				text : {content : "Чернівці"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Chernihiv1" : {
				x: 200,
				y: 100,
				text : {content : "Чернігів"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Cherkasy1" : {
				x: 200,
				y: 100,
				text : {content : "Черкаси"}, 
				href:"http://en.wikipedia.org/wiki/Ukraine"
			},
			"Crimea1" : {
				x: 396,
				y: 348,
				text : {content : "Сімферополь", attrs : {transform : "t1,1"}},
				href:"http://en.wikipedia.org/wiki/Ukraine"
			}
		}
	});
	
});