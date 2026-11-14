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
			1450.0,
			680.0
		],
		"openrect": [
			0.0,
			0.0,
			552.0,
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
		"devicewidth": 552.0,
		"description": "8 absolute encoders sending MIDI CC with editable labels and per-encoder CC numbers",
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
						520,
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
					"maxclass": "textedit",
					"varname": "label_text_1",
					"patching_rect": [
						100,
						60,
						64,
						20
					],
					"presentation": 1,
					"presentation_rect": [
						8,
						6,
						60,
						18
					],
					"numinlets": 1,
					"numoutlets": 4,
					"outlettype": [
						"",
						"int",
						"",
						""
					],
					"text": "Enc 1",
					"keymode": 1,
					"lines": 1,
					"wordwrap": 0,
					"tabmode": 0,
					"fontsize": 10.0,
					"fontface": 1,
					"textjustification": 1,
					"bgcolor": [
						0.17,
						0.17,
						0.17,
						1.0
					],
					"textcolor": [
						0.88,
						0.88,
						0.88,
						1.0
					],
					"bordercolor": [
						0.3,
						0.3,
						0.3,
						1.0
					],
					"border": 1.0,
					"rounded": 3.0,
					"hint": "Click, type a label for encoder 1, press Enter",
					"id": "obj-3"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "route text",
					"patching_rect": [
						100,
						90,
						60,
						22
					],
					"numinlets": 2,
					"numoutlets": 2,
					"outlettype": [
						"",
						""
					],
					"id": "obj-4"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "tosymbol",
					"patching_rect": [
						100,
						118,
						58,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-5"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pattr label1",
					"patching_rect": [
						100,
						146,
						80,
						22
					],
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"",
						""
					],
					"varname": "label1",
					"parameter_enable": 1,
					"restore": [
						"Enc 1"
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Label 1",
							"parameter_shortname": "Label 1",
							"parameter_type": 3,
							"parameter_invisible": 1
						}
					},
					"id": "obj-6"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "prepend set",
					"patching_rect": [
						170,
						90,
						72,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-7"
				}
			},
			{
				"box": {
					"maxclass": "live.dial",
					"varname": "Encoder 1",
					"patching_rect": [
						100,
						200,
						44,
						48
					],
					"presentation": 1,
					"presentation_rect": [
						16.0,
						28,
						44,
						48
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
							"parameter_longname": "Encoder 1",
							"parameter_shortname": "Enc 1",
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
					"id": "obj-8"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "CC#",
					"patching_rect": [
						160,
						260,
						30,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						8,
						84,
						26,
						18
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 9.0,
					"textjustification": 0,
					"id": "obj-9"
				}
			},
			{
				"box": {
					"maxclass": "live.numbox",
					"varname": "CC# 1",
					"patching_rect": [
						160,
						280,
						40,
						15
					],
					"presentation": 1,
					"presentation_rect": [
						34,
						85,
						34,
						15
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "CC# 1",
							"parameter_shortname": "CC1",
							"parameter_type": 1,
							"parameter_mmin": 0.0,
							"parameter_mmax": 127.0,
							"parameter_initial_enable": 1,
							"parameter_initial": [
								20
							],
							"parameter_unitstyle": 0,
							"parameter_invisible": 1
						}
					},
					"id": "obj-10"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						100,
						320,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-11"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 20 0",
					"patching_rect": [
						100,
						380,
						90,
						22
					],
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-12"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "iter",
					"patching_rect": [
						100,
						420,
						34,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"id": "obj-13"
				}
			},
			{
				"box": {
					"maxclass": "textedit",
					"varname": "label_text_2",
					"patching_rect": [
						260,
						60,
						64,
						20
					],
					"presentation": 1,
					"presentation_rect": [
						76,
						6,
						60,
						18
					],
					"numinlets": 1,
					"numoutlets": 4,
					"outlettype": [
						"",
						"int",
						"",
						""
					],
					"text": "Enc 2",
					"keymode": 1,
					"lines": 1,
					"wordwrap": 0,
					"tabmode": 0,
					"fontsize": 10.0,
					"fontface": 1,
					"textjustification": 1,
					"bgcolor": [
						0.17,
						0.17,
						0.17,
						1.0
					],
					"textcolor": [
						0.88,
						0.88,
						0.88,
						1.0
					],
					"bordercolor": [
						0.3,
						0.3,
						0.3,
						1.0
					],
					"border": 1.0,
					"rounded": 3.0,
					"hint": "Click, type a label for encoder 2, press Enter",
					"id": "obj-14"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "route text",
					"patching_rect": [
						260,
						90,
						60,
						22
					],
					"numinlets": 2,
					"numoutlets": 2,
					"outlettype": [
						"",
						""
					],
					"id": "obj-15"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "tosymbol",
					"patching_rect": [
						260,
						118,
						58,
						22
					],
					"numinlets": 1,
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
					"text": "pattr label2",
					"patching_rect": [
						260,
						146,
						80,
						22
					],
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"",
						""
					],
					"varname": "label2",
					"parameter_enable": 1,
					"restore": [
						"Enc 2"
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Label 2",
							"parameter_shortname": "Label 2",
							"parameter_type": 3,
							"parameter_invisible": 1
						}
					},
					"id": "obj-17"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "prepend set",
					"patching_rect": [
						330,
						90,
						72,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-18"
				}
			},
			{
				"box": {
					"maxclass": "live.dial",
					"varname": "Encoder 2",
					"patching_rect": [
						260,
						200,
						44,
						48
					],
					"presentation": 1,
					"presentation_rect": [
						84.0,
						28,
						44,
						48
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
							"parameter_longname": "Encoder 2",
							"parameter_shortname": "Enc 2",
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
					"id": "obj-19"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "CC#",
					"patching_rect": [
						320,
						260,
						30,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						76,
						84,
						26,
						18
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 9.0,
					"textjustification": 0,
					"id": "obj-20"
				}
			},
			{
				"box": {
					"maxclass": "live.numbox",
					"varname": "CC# 2",
					"patching_rect": [
						320,
						280,
						40,
						15
					],
					"presentation": 1,
					"presentation_rect": [
						102,
						85,
						34,
						15
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "CC# 2",
							"parameter_shortname": "CC2",
							"parameter_type": 1,
							"parameter_mmin": 0.0,
							"parameter_mmax": 127.0,
							"parameter_initial_enable": 1,
							"parameter_initial": [
								21
							],
							"parameter_unitstyle": 0,
							"parameter_invisible": 1
						}
					},
					"id": "obj-21"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						260,
						320,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-22"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 21 0",
					"patching_rect": [
						260,
						380,
						90,
						22
					],
					"numinlets": 3,
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
					"text": "iter",
					"patching_rect": [
						260,
						420,
						34,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"id": "obj-24"
				}
			},
			{
				"box": {
					"maxclass": "textedit",
					"varname": "label_text_3",
					"patching_rect": [
						420,
						60,
						64,
						20
					],
					"presentation": 1,
					"presentation_rect": [
						144,
						6,
						60,
						18
					],
					"numinlets": 1,
					"numoutlets": 4,
					"outlettype": [
						"",
						"int",
						"",
						""
					],
					"text": "Enc 3",
					"keymode": 1,
					"lines": 1,
					"wordwrap": 0,
					"tabmode": 0,
					"fontsize": 10.0,
					"fontface": 1,
					"textjustification": 1,
					"bgcolor": [
						0.17,
						0.17,
						0.17,
						1.0
					],
					"textcolor": [
						0.88,
						0.88,
						0.88,
						1.0
					],
					"bordercolor": [
						0.3,
						0.3,
						0.3,
						1.0
					],
					"border": 1.0,
					"rounded": 3.0,
					"hint": "Click, type a label for encoder 3, press Enter",
					"id": "obj-25"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "route text",
					"patching_rect": [
						420,
						90,
						60,
						22
					],
					"numinlets": 2,
					"numoutlets": 2,
					"outlettype": [
						"",
						""
					],
					"id": "obj-26"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "tosymbol",
					"patching_rect": [
						420,
						118,
						58,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-27"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pattr label3",
					"patching_rect": [
						420,
						146,
						80,
						22
					],
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"",
						""
					],
					"varname": "label3",
					"parameter_enable": 1,
					"restore": [
						"Enc 3"
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Label 3",
							"parameter_shortname": "Label 3",
							"parameter_type": 3,
							"parameter_invisible": 1
						}
					},
					"id": "obj-28"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "prepend set",
					"patching_rect": [
						490,
						90,
						72,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-29"
				}
			},
			{
				"box": {
					"maxclass": "live.dial",
					"varname": "Encoder 3",
					"patching_rect": [
						420,
						200,
						44,
						48
					],
					"presentation": 1,
					"presentation_rect": [
						152.0,
						28,
						44,
						48
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
							"parameter_longname": "Encoder 3",
							"parameter_shortname": "Enc 3",
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
					"id": "obj-30"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "CC#",
					"patching_rect": [
						480,
						260,
						30,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						144,
						84,
						26,
						18
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 9.0,
					"textjustification": 0,
					"id": "obj-31"
				}
			},
			{
				"box": {
					"maxclass": "live.numbox",
					"varname": "CC# 3",
					"patching_rect": [
						480,
						280,
						40,
						15
					],
					"presentation": 1,
					"presentation_rect": [
						170,
						85,
						34,
						15
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "CC# 3",
							"parameter_shortname": "CC3",
							"parameter_type": 1,
							"parameter_mmin": 0.0,
							"parameter_mmax": 127.0,
							"parameter_initial_enable": 1,
							"parameter_initial": [
								22
							],
							"parameter_unitstyle": 0,
							"parameter_invisible": 1
						}
					},
					"id": "obj-32"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						420,
						320,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-33"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 22 0",
					"patching_rect": [
						420,
						380,
						90,
						22
					],
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-34"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "iter",
					"patching_rect": [
						420,
						420,
						34,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"id": "obj-35"
				}
			},
			{
				"box": {
					"maxclass": "textedit",
					"varname": "label_text_4",
					"patching_rect": [
						580,
						60,
						64,
						20
					],
					"presentation": 1,
					"presentation_rect": [
						212,
						6,
						60,
						18
					],
					"numinlets": 1,
					"numoutlets": 4,
					"outlettype": [
						"",
						"int",
						"",
						""
					],
					"text": "Enc 4",
					"keymode": 1,
					"lines": 1,
					"wordwrap": 0,
					"tabmode": 0,
					"fontsize": 10.0,
					"fontface": 1,
					"textjustification": 1,
					"bgcolor": [
						0.17,
						0.17,
						0.17,
						1.0
					],
					"textcolor": [
						0.88,
						0.88,
						0.88,
						1.0
					],
					"bordercolor": [
						0.3,
						0.3,
						0.3,
						1.0
					],
					"border": 1.0,
					"rounded": 3.0,
					"hint": "Click, type a label for encoder 4, press Enter",
					"id": "obj-36"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "route text",
					"patching_rect": [
						580,
						90,
						60,
						22
					],
					"numinlets": 2,
					"numoutlets": 2,
					"outlettype": [
						"",
						""
					],
					"id": "obj-37"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "tosymbol",
					"patching_rect": [
						580,
						118,
						58,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-38"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pattr label4",
					"patching_rect": [
						580,
						146,
						80,
						22
					],
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"",
						""
					],
					"varname": "label4",
					"parameter_enable": 1,
					"restore": [
						"Enc 4"
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Label 4",
							"parameter_shortname": "Label 4",
							"parameter_type": 3,
							"parameter_invisible": 1
						}
					},
					"id": "obj-39"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "prepend set",
					"patching_rect": [
						650,
						90,
						72,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-40"
				}
			},
			{
				"box": {
					"maxclass": "live.dial",
					"varname": "Encoder 4",
					"patching_rect": [
						580,
						200,
						44,
						48
					],
					"presentation": 1,
					"presentation_rect": [
						220.0,
						28,
						44,
						48
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
							"parameter_longname": "Encoder 4",
							"parameter_shortname": "Enc 4",
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
					"id": "obj-41"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "CC#",
					"patching_rect": [
						640,
						260,
						30,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						212,
						84,
						26,
						18
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 9.0,
					"textjustification": 0,
					"id": "obj-42"
				}
			},
			{
				"box": {
					"maxclass": "live.numbox",
					"varname": "CC# 4",
					"patching_rect": [
						640,
						280,
						40,
						15
					],
					"presentation": 1,
					"presentation_rect": [
						238,
						85,
						34,
						15
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "CC# 4",
							"parameter_shortname": "CC4",
							"parameter_type": 1,
							"parameter_mmin": 0.0,
							"parameter_mmax": 127.0,
							"parameter_initial_enable": 1,
							"parameter_initial": [
								23
							],
							"parameter_unitstyle": 0,
							"parameter_invisible": 1
						}
					},
					"id": "obj-43"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						580,
						320,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-44"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 23 0",
					"patching_rect": [
						580,
						380,
						90,
						22
					],
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-45"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "iter",
					"patching_rect": [
						580,
						420,
						34,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"id": "obj-46"
				}
			},
			{
				"box": {
					"maxclass": "textedit",
					"varname": "label_text_5",
					"patching_rect": [
						740,
						60,
						64,
						20
					],
					"presentation": 1,
					"presentation_rect": [
						280,
						6,
						60,
						18
					],
					"numinlets": 1,
					"numoutlets": 4,
					"outlettype": [
						"",
						"int",
						"",
						""
					],
					"text": "Enc 5",
					"keymode": 1,
					"lines": 1,
					"wordwrap": 0,
					"tabmode": 0,
					"fontsize": 10.0,
					"fontface": 1,
					"textjustification": 1,
					"bgcolor": [
						0.17,
						0.17,
						0.17,
						1.0
					],
					"textcolor": [
						0.88,
						0.88,
						0.88,
						1.0
					],
					"bordercolor": [
						0.3,
						0.3,
						0.3,
						1.0
					],
					"border": 1.0,
					"rounded": 3.0,
					"hint": "Click, type a label for encoder 5, press Enter",
					"id": "obj-47"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "route text",
					"patching_rect": [
						740,
						90,
						60,
						22
					],
					"numinlets": 2,
					"numoutlets": 2,
					"outlettype": [
						"",
						""
					],
					"id": "obj-48"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "tosymbol",
					"patching_rect": [
						740,
						118,
						58,
						22
					],
					"numinlets": 1,
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
					"text": "pattr label5",
					"patching_rect": [
						740,
						146,
						80,
						22
					],
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"",
						""
					],
					"varname": "label5",
					"parameter_enable": 1,
					"restore": [
						"Enc 5"
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Label 5",
							"parameter_shortname": "Label 5",
							"parameter_type": 3,
							"parameter_invisible": 1
						}
					},
					"id": "obj-50"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "prepend set",
					"patching_rect": [
						810,
						90,
						72,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-51"
				}
			},
			{
				"box": {
					"maxclass": "live.dial",
					"varname": "Encoder 5",
					"patching_rect": [
						740,
						200,
						44,
						48
					],
					"presentation": 1,
					"presentation_rect": [
						288.0,
						28,
						44,
						48
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
							"parameter_longname": "Encoder 5",
							"parameter_shortname": "Enc 5",
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
					"id": "obj-52"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "CC#",
					"patching_rect": [
						800,
						260,
						30,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						280,
						84,
						26,
						18
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 9.0,
					"textjustification": 0,
					"id": "obj-53"
				}
			},
			{
				"box": {
					"maxclass": "live.numbox",
					"varname": "CC# 5",
					"patching_rect": [
						800,
						280,
						40,
						15
					],
					"presentation": 1,
					"presentation_rect": [
						306,
						85,
						34,
						15
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "CC# 5",
							"parameter_shortname": "CC5",
							"parameter_type": 1,
							"parameter_mmin": 0.0,
							"parameter_mmax": 127.0,
							"parameter_initial_enable": 1,
							"parameter_initial": [
								24
							],
							"parameter_unitstyle": 0,
							"parameter_invisible": 1
						}
					},
					"id": "obj-54"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						740,
						320,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-55"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 24 0",
					"patching_rect": [
						740,
						380,
						90,
						22
					],
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-56"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "iter",
					"patching_rect": [
						740,
						420,
						34,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"id": "obj-57"
				}
			},
			{
				"box": {
					"maxclass": "textedit",
					"varname": "label_text_6",
					"patching_rect": [
						900,
						60,
						64,
						20
					],
					"presentation": 1,
					"presentation_rect": [
						348,
						6,
						60,
						18
					],
					"numinlets": 1,
					"numoutlets": 4,
					"outlettype": [
						"",
						"int",
						"",
						""
					],
					"text": "Enc 6",
					"keymode": 1,
					"lines": 1,
					"wordwrap": 0,
					"tabmode": 0,
					"fontsize": 10.0,
					"fontface": 1,
					"textjustification": 1,
					"bgcolor": [
						0.17,
						0.17,
						0.17,
						1.0
					],
					"textcolor": [
						0.88,
						0.88,
						0.88,
						1.0
					],
					"bordercolor": [
						0.3,
						0.3,
						0.3,
						1.0
					],
					"border": 1.0,
					"rounded": 3.0,
					"hint": "Click, type a label for encoder 6, press Enter",
					"id": "obj-58"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "route text",
					"patching_rect": [
						900,
						90,
						60,
						22
					],
					"numinlets": 2,
					"numoutlets": 2,
					"outlettype": [
						"",
						""
					],
					"id": "obj-59"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "tosymbol",
					"patching_rect": [
						900,
						118,
						58,
						22
					],
					"numinlets": 1,
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
					"text": "pattr label6",
					"patching_rect": [
						900,
						146,
						80,
						22
					],
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"",
						""
					],
					"varname": "label6",
					"parameter_enable": 1,
					"restore": [
						"Enc 6"
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Label 6",
							"parameter_shortname": "Label 6",
							"parameter_type": 3,
							"parameter_invisible": 1
						}
					},
					"id": "obj-61"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "prepend set",
					"patching_rect": [
						970,
						90,
						72,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-62"
				}
			},
			{
				"box": {
					"maxclass": "live.dial",
					"varname": "Encoder 6",
					"patching_rect": [
						900,
						200,
						44,
						48
					],
					"presentation": 1,
					"presentation_rect": [
						356.0,
						28,
						44,
						48
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
							"parameter_longname": "Encoder 6",
							"parameter_shortname": "Enc 6",
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
					"id": "obj-63"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "CC#",
					"patching_rect": [
						960,
						260,
						30,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						348,
						84,
						26,
						18
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 9.0,
					"textjustification": 0,
					"id": "obj-64"
				}
			},
			{
				"box": {
					"maxclass": "live.numbox",
					"varname": "CC# 6",
					"patching_rect": [
						960,
						280,
						40,
						15
					],
					"presentation": 1,
					"presentation_rect": [
						374,
						85,
						34,
						15
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "CC# 6",
							"parameter_shortname": "CC6",
							"parameter_type": 1,
							"parameter_mmin": 0.0,
							"parameter_mmax": 127.0,
							"parameter_initial_enable": 1,
							"parameter_initial": [
								25
							],
							"parameter_unitstyle": 0,
							"parameter_invisible": 1
						}
					},
					"id": "obj-65"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						900,
						320,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-66"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 25 0",
					"patching_rect": [
						900,
						380,
						90,
						22
					],
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-67"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "iter",
					"patching_rect": [
						900,
						420,
						34,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"id": "obj-68"
				}
			},
			{
				"box": {
					"maxclass": "textedit",
					"varname": "label_text_7",
					"patching_rect": [
						1060,
						60,
						64,
						20
					],
					"presentation": 1,
					"presentation_rect": [
						416,
						6,
						60,
						18
					],
					"numinlets": 1,
					"numoutlets": 4,
					"outlettype": [
						"",
						"int",
						"",
						""
					],
					"text": "Enc 7",
					"keymode": 1,
					"lines": 1,
					"wordwrap": 0,
					"tabmode": 0,
					"fontsize": 10.0,
					"fontface": 1,
					"textjustification": 1,
					"bgcolor": [
						0.17,
						0.17,
						0.17,
						1.0
					],
					"textcolor": [
						0.88,
						0.88,
						0.88,
						1.0
					],
					"bordercolor": [
						0.3,
						0.3,
						0.3,
						1.0
					],
					"border": 1.0,
					"rounded": 3.0,
					"hint": "Click, type a label for encoder 7, press Enter",
					"id": "obj-69"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "route text",
					"patching_rect": [
						1060,
						90,
						60,
						22
					],
					"numinlets": 2,
					"numoutlets": 2,
					"outlettype": [
						"",
						""
					],
					"id": "obj-70"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "tosymbol",
					"patching_rect": [
						1060,
						118,
						58,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-71"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pattr label7",
					"patching_rect": [
						1060,
						146,
						80,
						22
					],
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"",
						""
					],
					"varname": "label7",
					"parameter_enable": 1,
					"restore": [
						"Enc 7"
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Label 7",
							"parameter_shortname": "Label 7",
							"parameter_type": 3,
							"parameter_invisible": 1
						}
					},
					"id": "obj-72"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "prepend set",
					"patching_rect": [
						1130,
						90,
						72,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-73"
				}
			},
			{
				"box": {
					"maxclass": "live.dial",
					"varname": "Encoder 7",
					"patching_rect": [
						1060,
						200,
						44,
						48
					],
					"presentation": 1,
					"presentation_rect": [
						424.0,
						28,
						44,
						48
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
							"parameter_longname": "Encoder 7",
							"parameter_shortname": "Enc 7",
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
					"id": "obj-74"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "CC#",
					"patching_rect": [
						1120,
						260,
						30,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						416,
						84,
						26,
						18
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 9.0,
					"textjustification": 0,
					"id": "obj-75"
				}
			},
			{
				"box": {
					"maxclass": "live.numbox",
					"varname": "CC# 7",
					"patching_rect": [
						1120,
						280,
						40,
						15
					],
					"presentation": 1,
					"presentation_rect": [
						442,
						85,
						34,
						15
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "CC# 7",
							"parameter_shortname": "CC7",
							"parameter_type": 1,
							"parameter_mmin": 0.0,
							"parameter_mmax": 127.0,
							"parameter_initial_enable": 1,
							"parameter_initial": [
								26
							],
							"parameter_unitstyle": 0,
							"parameter_invisible": 1
						}
					},
					"id": "obj-76"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						1060,
						320,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-77"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 26 0",
					"patching_rect": [
						1060,
						380,
						90,
						22
					],
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-78"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "iter",
					"patching_rect": [
						1060,
						420,
						34,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"id": "obj-79"
				}
			},
			{
				"box": {
					"maxclass": "textedit",
					"varname": "label_text_8",
					"patching_rect": [
						1220,
						60,
						64,
						20
					],
					"presentation": 1,
					"presentation_rect": [
						484,
						6,
						60,
						18
					],
					"numinlets": 1,
					"numoutlets": 4,
					"outlettype": [
						"",
						"int",
						"",
						""
					],
					"text": "Enc 8",
					"keymode": 1,
					"lines": 1,
					"wordwrap": 0,
					"tabmode": 0,
					"fontsize": 10.0,
					"fontface": 1,
					"textjustification": 1,
					"bgcolor": [
						0.17,
						0.17,
						0.17,
						1.0
					],
					"textcolor": [
						0.88,
						0.88,
						0.88,
						1.0
					],
					"bordercolor": [
						0.3,
						0.3,
						0.3,
						1.0
					],
					"border": 1.0,
					"rounded": 3.0,
					"hint": "Click, type a label for encoder 8, press Enter",
					"id": "obj-80"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "route text",
					"patching_rect": [
						1220,
						90,
						60,
						22
					],
					"numinlets": 2,
					"numoutlets": 2,
					"outlettype": [
						"",
						""
					],
					"id": "obj-81"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "tosymbol",
					"patching_rect": [
						1220,
						118,
						58,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-82"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pattr label8",
					"patching_rect": [
						1220,
						146,
						80,
						22
					],
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"",
						""
					],
					"varname": "label8",
					"parameter_enable": 1,
					"restore": [
						"Enc 8"
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Label 8",
							"parameter_shortname": "Label 8",
							"parameter_type": 3,
							"parameter_invisible": 1
						}
					},
					"id": "obj-83"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "prepend set",
					"patching_rect": [
						1290,
						90,
						72,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-84"
				}
			},
			{
				"box": {
					"maxclass": "live.dial",
					"varname": "Encoder 8",
					"patching_rect": [
						1220,
						200,
						44,
						48
					],
					"presentation": 1,
					"presentation_rect": [
						492.0,
						28,
						44,
						48
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
							"parameter_longname": "Encoder 8",
							"parameter_shortname": "Enc 8",
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
					"id": "obj-85"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "CC#",
					"patching_rect": [
						1280,
						260,
						30,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						484,
						84,
						26,
						18
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 9.0,
					"textjustification": 0,
					"id": "obj-86"
				}
			},
			{
				"box": {
					"maxclass": "live.numbox",
					"varname": "CC# 8",
					"patching_rect": [
						1280,
						280,
						40,
						15
					],
					"presentation": 1,
					"presentation_rect": [
						510,
						85,
						34,
						15
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "CC# 8",
							"parameter_shortname": "CC8",
							"parameter_type": 1,
							"parameter_mmin": 0.0,
							"parameter_mmax": 127.0,
							"parameter_initial_enable": 1,
							"parameter_initial": [
								27
							],
							"parameter_unitstyle": 0,
							"parameter_invisible": 1
						}
					},
					"id": "obj-87"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "t b i",
					"patching_rect": [
						1220,
						320,
						40,
						22
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"id": "obj-88"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "pack 176 27 0",
					"patching_rect": [
						1220,
						380,
						90,
						22
					],
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"id": "obj-89"
				}
			},
			{
				"box": {
					"maxclass": "newobj",
					"text": "iter",
					"patching_rect": [
						1220,
						420,
						34,
						22
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"id": "obj-90"
				}
			},
			{
				"box": {
					"maxclass": "live.comment",
					"text": "Label: click + Enter.  Output: CC on the track's MIDI routing/channel",
					"patching_rect": [
						20,
						600,
						380,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						8,
						140,
						536,
						18
					],
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"fontsize": 9.0,
					"id": "obj-91"
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
						"obj-5",
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
						"obj-3",
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
						"obj-11",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-11",
						1
					],
					"destination": [
						"obj-12",
						2
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
						"obj-10",
						0
					],
					"destination": [
						"obj-12",
						1
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
						"obj-14",
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
						"obj-22",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-22",
						1
					],
					"destination": [
						"obj-23",
						2
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
						"obj-23",
						1
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
						"obj-27",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-27",
						0
					],
					"destination": [
						"obj-28",
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
						"obj-25",
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
						"obj-33",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-33",
						1
					],
					"destination": [
						"obj-34",
						2
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
						"obj-34",
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
						"obj-34",
						1
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
						"obj-35",
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
						"obj-2",
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
						"obj-36",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-41",
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
						1
					],
					"destination": [
						"obj-45",
						2
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
						"obj-43",
						0
					],
					"destination": [
						"obj-45",
						1
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
						"obj-2",
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
						"obj-48",
						0
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
						"obj-47",
						0
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
						"obj-55",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-55",
						1
					],
					"destination": [
						"obj-56",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-55",
						0
					],
					"destination": [
						"obj-56",
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
						"obj-56",
						1
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
						"obj-2",
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
						"obj-62",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-62",
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
						"obj-63",
						0
					],
					"destination": [
						"obj-66",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-66",
						1
					],
					"destination": [
						"obj-67",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-66",
						0
					],
					"destination": [
						"obj-67",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-65",
						0
					],
					"destination": [
						"obj-67",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-67",
						0
					],
					"destination": [
						"obj-68",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-68",
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
						"obj-69",
						0
					],
					"destination": [
						"obj-70",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-70",
						0
					],
					"destination": [
						"obj-71",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-71",
						0
					],
					"destination": [
						"obj-72",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-72",
						0
					],
					"destination": [
						"obj-73",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-73",
						0
					],
					"destination": [
						"obj-69",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-74",
						0
					],
					"destination": [
						"obj-77",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-77",
						1
					],
					"destination": [
						"obj-78",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-77",
						0
					],
					"destination": [
						"obj-78",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-76",
						0
					],
					"destination": [
						"obj-78",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-78",
						0
					],
					"destination": [
						"obj-79",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-79",
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
						"obj-80",
						0
					],
					"destination": [
						"obj-81",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-81",
						0
					],
					"destination": [
						"obj-82",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-82",
						0
					],
					"destination": [
						"obj-83",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-83",
						0
					],
					"destination": [
						"obj-84",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-84",
						0
					],
					"destination": [
						"obj-80",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-85",
						0
					],
					"destination": [
						"obj-88",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-88",
						1
					],
					"destination": [
						"obj-89",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-88",
						0
					],
					"destination": [
						"obj-89",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-87",
						0
					],
					"destination": [
						"obj-89",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-89",
						0
					],
					"destination": [
						"obj-90",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-90",
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