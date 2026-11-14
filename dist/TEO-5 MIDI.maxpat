{
	"patcher": {
		"fileversion": 1,
		"appversion": {
			"major": 8,
			"minor": 5,
			"revision": 5,
			"architecture": "x64",
			"modernui": 1
		},
		"classnamespace": "box",
		"rect": [
			100.0,
			100.0,
			1300.0,
			520.0
		],
		"openrect": [
			0.0,
			0.0,
			344.0,
			169.0
		],
		"bglocked": 0,
		"openinpresentation": 1,
		"default_fontsize": 10.0,
		"default_fontface": 0,
		"default_fontname": "Arial Bold",
		"gridonopen": 1,
		"gridsize": [
			8.0,
			8.0
		],
		"gridsnaponopen": 1,
		"objectsnaponopen": 1,
		"statusbarvisible": 2,
		"toolbarvisible": 1,
		"boxanimatetime": 500,
		"enablehscroll": 1,
		"enablevscroll": 1,
		"devicewidth": 344.0,
		"description": "TEO-5 MIDI: 8 absolute encoders sending fixed MIDI CCs",
		"digest": "",
		"tags": "",
		"style": "",
		"subpatcher_template": "",
		"assistshowspatchername": 0,
		"boxes": [
			{
				"box": {
					"maxclass": "newobj",
					"text": "midiin",
					"patching_rect": [
						20,
						20,
						45,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"id": "obj-1"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "midiout",
					"patching_rect": [
						20,
						400,
						55,
						22
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"id": "obj-2"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "Cutoff",
					"patching_rect": [
						100,
						60,
						64,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						6,
						4,
						80,
						16
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 10.0,
					"fontface": 1,
					"textjustification": 1,
					"textcolor": [
						0.88,
						0.88,
						0.88,
						1.0
					],
					"id": "obj-3"
				}
			},
			{
				"box": {
					"maxclass": "live.dial",
					"varname": "Cutoff",
					"patching_rect": [
						100,
						90,
						44,
						48
					],
					"presentation": 1,
					"presentation_rect": [
						24.0,
						20,
						44,
						44
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"showname": 0,
					"shownumber": 1,
					"activedialcolor": [
						1.0,
						0.71,
						0.196,
						1.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Cutoff",
							"parameter_shortname": "Cutoff",
							"parameter_type": 1,
							"parameter_mmin": 0.0,
							"parameter_mmax": 127.0,
							"parameter_initial_enable": 1,
							"parameter_initial": [
								0
							],
							"parameter_unitstyle": 0
						}
					},
					"id": "obj-4"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "CC 33",
					"patching_rect": [
						100,
						150,
						50,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						6,
						65,
						80,
						16
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 9.0,
					"fontface": 0,
					"textjustification": 1,
					"textcolor": [
						0.6,
						0.6,
						0.6,
						1.0
					],
					"id": "obj-5"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						100,
						200,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-6"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 33 0",
					"patching_rect": [
						100,
						240,
						90,
						22
					],
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-7"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "iter",
					"patching_rect": [
						100,
						280,
						34,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"id": "obj-8"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "Resonance",
					"patching_rect": [
						240,
						60,
						64,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						90,
						4,
						80,
						16
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 10.0,
					"fontface": 1,
					"textjustification": 1,
					"textcolor": [
						0.88,
						0.88,
						0.88,
						1.0
					],
					"id": "obj-9"
				}
			},
			{
				"box": {
					"maxclass": "live.dial",
					"varname": "Resonance",
					"patching_rect": [
						240,
						90,
						44,
						48
					],
					"presentation": 1,
					"presentation_rect": [
						108.0,
						20,
						44,
						44
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"showname": 0,
					"shownumber": 1,
					"activedialcolor": [
						1.0,
						0.71,
						0.196,
						1.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Resonance",
							"parameter_shortname": "Resonance",
							"parameter_type": 1,
							"parameter_mmin": 0.0,
							"parameter_mmax": 127.0,
							"parameter_initial_enable": 1,
							"parameter_initial": [
								0
							],
							"parameter_unitstyle": 0
						}
					},
					"id": "obj-10"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "CC 34",
					"patching_rect": [
						240,
						150,
						50,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						90,
						65,
						80,
						16
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 9.0,
					"fontface": 0,
					"textjustification": 1,
					"textcolor": [
						0.6,
						0.6,
						0.6,
						1.0
					],
					"id": "obj-11"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						240,
						200,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-12"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 34 0",
					"patching_rect": [
						240,
						240,
						90,
						22
					],
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-13"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "iter",
					"patching_rect": [
						240,
						280,
						34,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"id": "obj-14"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "Filter",
					"patching_rect": [
						380,
						60,
						64,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						174,
						4,
						80,
						16
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 10.0,
					"fontface": 1,
					"textjustification": 1,
					"textcolor": [
						0.88,
						0.88,
						0.88,
						1.0
					],
					"id": "obj-15"
				}
			},
			{
				"box": {
					"maxclass": "live.dial",
					"varname": "Filter",
					"patching_rect": [
						380,
						90,
						44,
						48
					],
					"presentation": 1,
					"presentation_rect": [
						192.0,
						20,
						44,
						44
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"showname": 0,
					"shownumber": 1,
					"activedialcolor": [
						1.0,
						0.71,
						0.196,
						1.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Filter",
							"parameter_shortname": "Filter",
							"parameter_type": 1,
							"parameter_mmin": 0.0,
							"parameter_mmax": 127.0,
							"parameter_initial_enable": 1,
							"parameter_initial": [
								0
							],
							"parameter_unitstyle": 0
						}
					},
					"id": "obj-16"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "CC 35",
					"patching_rect": [
						380,
						150,
						50,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						174,
						65,
						80,
						16
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 9.0,
					"fontface": 0,
					"textjustification": 1,
					"textcolor": [
						0.6,
						0.6,
						0.6,
						1.0
					],
					"id": "obj-17"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						380,
						200,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-18"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 35 0",
					"patching_rect": [
						380,
						240,
						90,
						22
					],
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-19"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "iter",
					"patching_rect": [
						380,
						280,
						34,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"id": "obj-20"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "Reverb",
					"patching_rect": [
						520,
						60,
						64,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						258,
						4,
						80,
						16
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 10.0,
					"fontface": 1,
					"textjustification": 1,
					"textcolor": [
						0.88,
						0.88,
						0.88,
						1.0
					],
					"id": "obj-21"
				}
			},
			{
				"box": {
					"maxclass": "live.dial",
					"varname": "Reverb",
					"patching_rect": [
						520,
						90,
						44,
						48
					],
					"presentation": 1,
					"presentation_rect": [
						276.0,
						20,
						44,
						44
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"showname": 0,
					"shownumber": 1,
					"activedialcolor": [
						1.0,
						0.71,
						0.196,
						1.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Reverb",
							"parameter_shortname": "Reverb",
							"parameter_type": 1,
							"parameter_mmin": 0.0,
							"parameter_mmax": 127.0,
							"parameter_initial_enable": 1,
							"parameter_initial": [
								0
							],
							"parameter_unitstyle": 0
						}
					},
					"id": "obj-22"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "CC 24",
					"patching_rect": [
						520,
						150,
						50,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						258,
						65,
						80,
						16
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 9.0,
					"fontface": 0,
					"textjustification": 1,
					"textcolor": [
						0.6,
						0.6,
						0.6,
						1.0
					],
					"id": "obj-23"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						520,
						200,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-24"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 24 0",
					"patching_rect": [
						520,
						240,
						90,
						22
					],
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-25"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "iter",
					"patching_rect": [
						520,
						280,
						34,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"id": "obj-26"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "Effects",
					"patching_rect": [
						660,
						60,
						64,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						6,
						86,
						80,
						16
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 10.0,
					"fontface": 1,
					"textjustification": 1,
					"textcolor": [
						0.88,
						0.88,
						0.88,
						1.0
					],
					"id": "obj-27"
				}
			},
			{
				"box": {
					"maxclass": "live.dial",
					"varname": "Effects",
					"patching_rect": [
						660,
						90,
						44,
						48
					],
					"presentation": 1,
					"presentation_rect": [
						24.0,
						102,
						44,
						44
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"showname": 0,
					"shownumber": 1,
					"activedialcolor": [
						1.0,
						0.71,
						0.196,
						1.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Effects",
							"parameter_shortname": "Effects",
							"parameter_type": 1,
							"parameter_mmin": 0.0,
							"parameter_mmax": 127.0,
							"parameter_initial_enable": 1,
							"parameter_initial": [
								0
							],
							"parameter_unitstyle": 0
						}
					},
					"id": "obj-28"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "CC 19",
					"patching_rect": [
						660,
						150,
						50,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						6,
						147,
						80,
						16
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 9.0,
					"fontface": 0,
					"textjustification": 1,
					"textcolor": [
						0.6,
						0.6,
						0.6,
						1.0
					],
					"id": "obj-29"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						660,
						200,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-30"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 19 0",
					"patching_rect": [
						660,
						240,
						90,
						22
					],
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-31"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "iter",
					"patching_rect": [
						660,
						280,
						34,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"id": "obj-32"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "Volume",
					"patching_rect": [
						800,
						60,
						64,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						90,
						86,
						80,
						16
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 10.0,
					"fontface": 1,
					"textjustification": 1,
					"textcolor": [
						0.88,
						0.88,
						0.88,
						1.0
					],
					"id": "obj-33"
				}
			},
			{
				"box": {
					"maxclass": "live.dial",
					"varname": "Volume",
					"patching_rect": [
						800,
						90,
						44,
						48
					],
					"presentation": 1,
					"presentation_rect": [
						108.0,
						102,
						44,
						44
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"showname": 0,
					"shownumber": 1,
					"activedialcolor": [
						1.0,
						0.71,
						0.196,
						1.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Volume",
							"parameter_shortname": "Volume",
							"parameter_type": 1,
							"parameter_mmin": 0.0,
							"parameter_mmax": 127.0,
							"parameter_initial_enable": 1,
							"parameter_initial": [
								0
							],
							"parameter_unitstyle": 0
						}
					},
					"id": "obj-34"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "CC 7",
					"patching_rect": [
						800,
						150,
						50,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						90,
						147,
						80,
						16
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 9.0,
					"fontface": 0,
					"textjustification": 1,
					"textcolor": [
						0.6,
						0.6,
						0.6,
						1.0
					],
					"id": "obj-35"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						800,
						200,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-36"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 7 0",
					"patching_rect": [
						800,
						240,
						90,
						22
					],
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-37"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "iter",
					"patching_rect": [
						800,
						280,
						34,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"id": "obj-38"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "Distortion",
					"patching_rect": [
						940,
						60,
						64,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						174,
						86,
						80,
						16
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 10.0,
					"fontface": 1,
					"textjustification": 1,
					"textcolor": [
						0.88,
						0.88,
						0.88,
						1.0
					],
					"id": "obj-39"
				}
			},
			{
				"box": {
					"maxclass": "live.dial",
					"varname": "Distortion",
					"patching_rect": [
						940,
						90,
						44,
						48
					],
					"presentation": 1,
					"presentation_rect": [
						192.0,
						102,
						44,
						44
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"showname": 0,
					"shownumber": 1,
					"activedialcolor": [
						1.0,
						0.71,
						0.196,
						1.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Distortion",
							"parameter_shortname": "Distortion",
							"parameter_type": 1,
							"parameter_mmin": 0.0,
							"parameter_mmax": 127.0,
							"parameter_initial_enable": 1,
							"parameter_initial": [
								0
							],
							"parameter_unitstyle": 0
						}
					},
					"id": "obj-40"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "CC 67",
					"patching_rect": [
						940,
						150,
						50,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						174,
						147,
						80,
						16
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 9.0,
					"fontface": 0,
					"textjustification": 1,
					"textcolor": [
						0.6,
						0.6,
						0.6,
						1.0
					],
					"id": "obj-41"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						940,
						200,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-42"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 67 0",
					"patching_rect": [
						940,
						240,
						90,
						22
					],
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-43"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "iter",
					"patching_rect": [
						940,
						280,
						34,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"id": "obj-44"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "Vintage",
					"patching_rect": [
						1080,
						60,
						64,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						258,
						86,
						80,
						16
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 10.0,
					"fontface": 1,
					"textjustification": 1,
					"textcolor": [
						0.88,
						0.88,
						0.88,
						1.0
					],
					"id": "obj-45"
				}
			},
			{
				"box": {
					"maxclass": "live.dial",
					"varname": "Vintage",
					"patching_rect": [
						1080,
						90,
						44,
						48
					],
					"presentation": 1,
					"presentation_rect": [
						276.0,
						102,
						44,
						44
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"showname": 0,
					"shownumber": 1,
					"activedialcolor": [
						1.0,
						0.71,
						0.196,
						1.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Vintage",
							"parameter_shortname": "Vintage",
							"parameter_type": 1,
							"parameter_mmin": 0.0,
							"parameter_mmax": 127.0,
							"parameter_initial_enable": 1,
							"parameter_initial": [
								0
							],
							"parameter_unitstyle": 0
						}
					},
					"id": "obj-46"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "CC 37",
					"patching_rect": [
						1080,
						150,
						50,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						258,
						147,
						80,
						16
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 9.0,
					"fontface": 0,
					"textjustification": 1,
					"textcolor": [
						0.6,
						0.6,
						0.6,
						1.0
					],
					"id": "obj-47"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						1080,
						200,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-48"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 37 0",
					"patching_rect": [
						1080,
						240,
						90,
						22
					],
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-49"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "iter",
					"patching_rect": [
						1080,
						280,
						34,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"id": "obj-50"
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"source": [
						"obj-1",
						0
					],
					"destination": [
						"obj-2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-4",
						0
					],
					"destination": [
						"obj-6",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-6",
						1
					],
					"destination": [
						"obj-7",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-6",
						0
					],
					"destination": [
						"obj-7",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-7",
						0
					],
					"destination": [
						"obj-8",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-8",
						0
					],
					"destination": [
						"obj-2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-10",
						0
					],
					"destination": [
						"obj-12",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-12",
						1
					],
					"destination": [
						"obj-13",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-12",
						0
					],
					"destination": [
						"obj-13",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-13",
						0
					],
					"destination": [
						"obj-14",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-14",
						0
					],
					"destination": [
						"obj-2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-16",
						0
					],
					"destination": [
						"obj-18",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-18",
						1
					],
					"destination": [
						"obj-19",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-18",
						0
					],
					"destination": [
						"obj-19",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-19",
						0
					],
					"destination": [
						"obj-20",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-20",
						0
					],
					"destination": [
						"obj-2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-22",
						0
					],
					"destination": [
						"obj-24",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-24",
						1
					],
					"destination": [
						"obj-25",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-24",
						0
					],
					"destination": [
						"obj-25",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-25",
						0
					],
					"destination": [
						"obj-26",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-26",
						0
					],
					"destination": [
						"obj-2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-28",
						0
					],
					"destination": [
						"obj-30",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-30",
						1
					],
					"destination": [
						"obj-31",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-30",
						0
					],
					"destination": [
						"obj-31",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-31",
						0
					],
					"destination": [
						"obj-32",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-32",
						0
					],
					"destination": [
						"obj-2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-34",
						0
					],
					"destination": [
						"obj-36",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-36",
						1
					],
					"destination": [
						"obj-37",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-36",
						0
					],
					"destination": [
						"obj-37",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-37",
						0
					],
					"destination": [
						"obj-38",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-38",
						0
					],
					"destination": [
						"obj-2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-40",
						0
					],
					"destination": [
						"obj-42",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-42",
						1
					],
					"destination": [
						"obj-43",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-42",
						0
					],
					"destination": [
						"obj-43",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-43",
						0
					],
					"destination": [
						"obj-44",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-44",
						0
					],
					"destination": [
						"obj-2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-46",
						0
					],
					"destination": [
						"obj-48",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-48",
						1
					],
					"destination": [
						"obj-49",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-48",
						0
					],
					"destination": [
						"obj-49",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-49",
						0
					],
					"destination": [
						"obj-50",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-50",
						0
					],
					"destination": [
						"obj-2",
						0
					]
				}
			}
		],
		"dependency_cache": [],
		"latency": 0,
		"is_mpe": 0,
		"external_mpe_tuning_enabled": 0,
		"minimum_live_version": "",
		"minimum_max_version": "",
		"platform_compatibility": 0,
		"autosave": 0,
		"amxdtype": 1835887981
	}
}