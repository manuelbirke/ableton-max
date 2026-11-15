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
					"maxclass": "newobj",
					"text": "live.thisdevice",
					"patching_rect": [
						1250,
						20,
						90,
						22
					],
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"bang",
						"int",
						"int"
					],
					"id": "obj-3"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "delay 250",
					"patching_rect": [
						1250,
						50,
						60,
						22
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"id": "obj-4"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t 1",
					"patching_rect": [
						1250,
						80,
						30,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"id": "obj-5"
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
					"id": "obj-6"
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
						22.0,
						22,
						48,
						54
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
							"parameter_initial_enable": 0,
							"parameter_initial": [
								0
							],
							"parameter_unitstyle": 0
						}
					},
					"id": "obj-7"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "change",
					"patching_rect": [
						100,
						150,
						50,
						22
					],
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"int",
						"int"
					],
					"id": "obj-8"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "gate 1 0",
					"patching_rect": [
						100,
						180,
						50,
						22
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-9"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						100,
						220,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-10"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 33 0",
					"patching_rect": [
						100,
						250,
						90,
						22
					],
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-11"
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
					"id": "obj-12"
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
					"id": "obj-13"
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
						106.0,
						22,
						48,
						54
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
							"parameter_initial_enable": 0,
							"parameter_initial": [
								0
							],
							"parameter_unitstyle": 0
						}
					},
					"id": "obj-14"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "change",
					"patching_rect": [
						240,
						150,
						50,
						22
					],
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"int",
						"int"
					],
					"id": "obj-15"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "gate 1 0",
					"patching_rect": [
						240,
						180,
						50,
						22
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-16"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						240,
						220,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-17"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 34 0",
					"patching_rect": [
						240,
						250,
						90,
						22
					],
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-18"
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
					"id": "obj-19"
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
					"id": "obj-20"
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
						190.0,
						22,
						48,
						54
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
							"parameter_initial_enable": 0,
							"parameter_initial": [
								0
							],
							"parameter_unitstyle": 0
						}
					},
					"id": "obj-21"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "change",
					"patching_rect": [
						380,
						150,
						50,
						22
					],
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"int",
						"int"
					],
					"id": "obj-22"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "gate 1 0",
					"patching_rect": [
						380,
						180,
						50,
						22
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-23"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						380,
						220,
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
					"text": "pack 176 35 0",
					"patching_rect": [
						380,
						250,
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
					"id": "obj-26"
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
					"id": "obj-27"
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
						274.0,
						22,
						48,
						54
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
							"parameter_initial_enable": 0,
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
					"maxclass": "newobj",
					"text": "change",
					"patching_rect": [
						520,
						150,
						50,
						22
					],
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"int",
						"int"
					],
					"id": "obj-29"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "gate 1 0",
					"patching_rect": [
						520,
						180,
						50,
						22
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-30"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						520,
						220,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-31"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 24 0",
					"patching_rect": [
						520,
						250,
						90,
						22
					],
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-32"
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
					"id": "obj-33"
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
					"id": "obj-34"
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
						22.0,
						104,
						48,
						54
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
							"parameter_initial_enable": 0,
							"parameter_initial": [
								0
							],
							"parameter_unitstyle": 0
						}
					},
					"id": "obj-35"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "change",
					"patching_rect": [
						660,
						150,
						50,
						22
					],
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"int",
						"int"
					],
					"id": "obj-36"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "gate 1 0",
					"patching_rect": [
						660,
						180,
						50,
						22
					],
					"numinlets": 2,
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
					"text": "t b i",
					"patching_rect": [
						660,
						220,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-38"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 19 0",
					"patching_rect": [
						660,
						250,
						90,
						22
					],
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-39"
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
					"id": "obj-40"
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
					"id": "obj-41"
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
						106.0,
						104,
						48,
						54
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
							"parameter_initial_enable": 0,
							"parameter_initial": [
								0
							],
							"parameter_unitstyle": 0
						}
					},
					"id": "obj-42"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "change",
					"patching_rect": [
						800,
						150,
						50,
						22
					],
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"int",
						"int"
					],
					"id": "obj-43"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "gate 1 0",
					"patching_rect": [
						800,
						180,
						50,
						22
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-44"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						800,
						220,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-45"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 7 0",
					"patching_rect": [
						800,
						250,
						90,
						22
					],
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-46"
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
					"id": "obj-47"
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
					"id": "obj-48"
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
						190.0,
						104,
						48,
						54
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
							"parameter_initial_enable": 0,
							"parameter_initial": [
								0
							],
							"parameter_unitstyle": 0
						}
					},
					"id": "obj-49"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "change",
					"patching_rect": [
						940,
						150,
						50,
						22
					],
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"int",
						"int"
					],
					"id": "obj-50"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "gate 1 0",
					"patching_rect": [
						940,
						180,
						50,
						22
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-51"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						940,
						220,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-52"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 67 0",
					"patching_rect": [
						940,
						250,
						90,
						22
					],
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-53"
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
					"id": "obj-54"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "Pan",
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
					"id": "obj-55"
				}
			},
			{
				"box": {
					"maxclass": "live.dial",
					"varname": "Pan",
					"patching_rect": [
						1080,
						90,
						44,
						48
					],
					"presentation": 1,
					"presentation_rect": [
						274.0,
						104,
						48,
						54
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
							"parameter_longname": "Pan",
							"parameter_shortname": "Pan",
							"parameter_type": 1,
							"parameter_mmin": 0.0,
							"parameter_mmax": 127.0,
							"parameter_initial_enable": 0,
							"parameter_initial": [
								0
							],
							"parameter_unitstyle": 0
						}
					},
					"id": "obj-56"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "change",
					"patching_rect": [
						1080,
						150,
						50,
						22
					],
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"int",
						"int"
					],
					"id": "obj-57"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "gate 1 0",
					"patching_rect": [
						1080,
						180,
						50,
						22
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-58"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						1080,
						220,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-59"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 113 0",
					"patching_rect": [
						1080,
						250,
						90,
						22
					],
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-60"
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
					"id": "obj-61"
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
						"obj-3",
						0
					],
					"destination": [
						"obj-4",
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
						"obj-5",
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
						"obj-9",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-5",
						0
					],
					"destination": [
						"obj-9",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-9",
						0
					],
					"destination": [
						"obj-10",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-10",
						1
					],
					"destination": [
						"obj-11",
						2
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
						"obj-11",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-11",
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
						"obj-14",
						0
					],
					"destination": [
						"obj-15",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-15",
						0
					],
					"destination": [
						"obj-16",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-5",
						0
					],
					"destination": [
						"obj-16",
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
						"obj-17",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-17",
						1
					],
					"destination": [
						"obj-18",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-17",
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
						"obj-2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-21",
						0
					],
					"destination": [
						"obj-22",
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
						"obj-23",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-5",
						0
					],
					"destination": [
						"obj-23",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-23",
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
						"obj-29",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-29",
						0
					],
					"destination": [
						"obj-30",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-5",
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
						1
					],
					"destination": [
						"obj-32",
						2
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
						"obj-33",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-33",
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
						"obj-35",
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
						0
					],
					"destination": [
						"obj-37",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-5",
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
						1
					],
					"destination": [
						"obj-39",
						2
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
						"obj-39",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-39",
						0
					],
					"destination": [
						"obj-40",
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
						"obj-2",
						0
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
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-5",
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
						"obj-45",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-45",
						1
					],
					"destination": [
						"obj-46",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-45",
						0
					],
					"destination": [
						"obj-46",
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
						"obj-47",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-47",
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
						"obj-51",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-5",
						0
					],
					"destination": [
						"obj-51",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-51",
						0
					],
					"destination": [
						"obj-52",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-52",
						1
					],
					"destination": [
						"obj-53",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-52",
						0
					],
					"destination": [
						"obj-53",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-53",
						0
					],
					"destination": [
						"obj-54",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-54",
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
						"obj-56",
						0
					],
					"destination": [
						"obj-57",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-57",
						0
					],
					"destination": [
						"obj-58",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-5",
						0
					],
					"destination": [
						"obj-58",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-58",
						0
					],
					"destination": [
						"obj-59",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-59",
						1
					],
					"destination": [
						"obj-60",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-59",
						0
					],
					"destination": [
						"obj-60",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-60",
						0
					],
					"destination": [
						"obj-61",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-61",
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