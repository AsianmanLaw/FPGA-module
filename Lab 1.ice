{
  "version": "1.2",
  "package": {
    "name": "",
    "version": "",
    "description": "",
    "author": "",
    "image": ""
  },
  "design": {
    "board": "TinyFPGA-BX",
    "graph": {
      "blocks": [
        {
          "id": "64f3fb72-0af1-4a4f-8b25-22839860ce5c",
          "type": "basic.input",
          "data": {
            "name": "minus",
            "pins": [
              {
                "index": "0",
                "name": "PIN_12",
                "value": "J1"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": 120,
            "y": 216
          }
        },
        {
          "id": "7ee6d922-7a34-4f14-8091-f4a5a30a48ed",
          "type": "basic.output",
          "data": {
            "name": "q",
            "range": "[3:0]",
            "pins": [
              {
                "index": "3",
                "name": "PIN_21",
                "value": "B7"
              },
              {
                "index": "2",
                "name": "PIN_20",
                "value": "A8"
              },
              {
                "index": "1",
                "name": "PIN_19",
                "value": "B8"
              },
              {
                "index": "0",
                "name": "PIN_18",
                "value": "A9"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 952,
            "y": 288
          }
        },
        {
          "id": "dfa25f98-27ef-4e78-a8a5-58671402aa6b",
          "type": "basic.input",
          "data": {
            "name": "invert",
            "pins": [
              {
                "index": "0",
                "name": "PIN_10",
                "value": "G2"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": 120,
            "y": 336
          }
        },
        {
          "id": "95f91de3-041e-4638-b2fb-c7817f146d43",
          "type": "basic.input",
          "data": {
            "name": "A",
            "range": "[3:0]",
            "pins": [
              {
                "index": "3",
                "name": "PIN_5",
                "value": "C1"
              },
              {
                "index": "2",
                "name": "PIN_6",
                "value": "D2"
              },
              {
                "index": "1",
                "name": "PIN_7",
                "value": "D1"
              },
              {
                "index": "0",
                "name": "PIN_8",
                "value": "E2"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": 120,
            "y": 408
          }
        },
        {
          "id": "4e18b2d6-4681-4636-9c7e-2be5ab570c97",
          "type": "basic.code",
          "data": {
            "code": "reg [3:0] a_aux;\n\nalways@(minus, invert, a) begin\n    if(~minus && invert) begin // checks to see if only minus is pressed \n        a_aux = ~a + 1;\n    end\n    else if(~invert && minus) begin\n        a_aux = ~a;\n    end\n    else begin\n        a_aux = a;\n    end\nend\n\nassign q = a_aux;",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "minus"
                },
                {
                  "name": "invert"
                },
                {
                  "name": "a",
                  "range": "[3:0]",
                  "size": 4
                }
              ],
              "out": [
                {
                  "name": "q",
                  "range": "[3:0]",
                  "size": 4
                }
              ]
            }
          },
          "position": {
            "x": 352,
            "y": 184
          },
          "size": {
            "width": 528,
            "height": 368
          }
        },
        {
          "id": "fa7c2504-40fb-4e39-93d6-ef911077a9c2",
          "type": "basic.info",
          "data": {
            "info": "\nA FPGA design to both Negate or Invert a 4-bit binary number. (The code is incomeplete, reer to worksheet)\n\nNote - if neither pushbutton or both are pressed together, the input binary value is ent to the output leds.\n\n\nwe use the common\"if-else else-if else\" command.\n\nFurther information on this \"if...\" command can befound on pg 298 of the\n\n\"Introduction to Logic Circuits Logic and Logic Design with Verilog\" e-book or of-course the lecture notes.\n",
            "readonly": false
          },
          "position": {
            "x": 144,
            "y": -96
          },
          "size": {
            "width": 872,
            "height": 208
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "95f91de3-041e-4638-b2fb-c7817f146d43",
            "port": "out"
          },
          "target": {
            "block": "4e18b2d6-4681-4636-9c7e-2be5ab570c97",
            "port": "a"
          },
          "size": 4
        },
        {
          "source": {
            "block": "4e18b2d6-4681-4636-9c7e-2be5ab570c97",
            "port": "q"
          },
          "target": {
            "block": "7ee6d922-7a34-4f14-8091-f4a5a30a48ed",
            "port": "in"
          },
          "size": 4
        },
        {
          "source": {
            "block": "64f3fb72-0af1-4a4f-8b25-22839860ce5c",
            "port": "out"
          },
          "target": {
            "block": "4e18b2d6-4681-4636-9c7e-2be5ab570c97",
            "port": "minus"
          }
        },
        {
          "source": {
            "block": "dfa25f98-27ef-4e78-a8a5-58671402aa6b",
            "port": "out"
          },
          "target": {
            "block": "4e18b2d6-4681-4636-9c7e-2be5ab570c97",
            "port": "invert"
          }
        }
      ]
    }
  },
  "dependencies": {}
}