import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/cart.dart';

class FormScreen extends StatefulWidget {
  final double total = 8.99;
  final String orderType = "Carryout";
  final String weekDay = "Wednesday";
  final DateTime dateTime = DateTime.now();
  final DateTime timeDate = DateTime.now();

  String formatDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  String formatTime(DateTime dateTime) {
    return '${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
  }

  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _firstName;
  String _lastName;
  String _email;
  String _phoneNumber;
  String paymentType = "";
  bool emailFromDominos = false;

  void setPaymentType(String value) {
    setState(() {
      paymentType = value;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFirstName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'First Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'First Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _firstName = value;
      },
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Last Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Last Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _lastName = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }

  Widget paymentTypeSelector() {
    return Column(
      children: <Widget>[
        RadioListTile(
          value: "Pay At Store",
          title: Container(
            child: Row(
              children: <Widget>[
                Text('Pay At Store ', style: TextStyle(fontSize: 14)),
                Text(
                  'Use Cash, Credit, Debit or Gift Card',
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
          groupValue: paymentType,
          onChanged: (String value) {
            setPaymentType(value);
          },
          activeColor: Colors.blue,
        ),
        Divider(
          thickness: 4,
        ),
        RadioListTile(
          value: "Pay Now With Debit or Credit Card",
          title: Text('Pay Now With Debit or Credit Card',
              style: TextStyle(fontSize: 14)),
          groupValue: paymentType,
          onChanged: (String value) {
            setPaymentType(value);
          },
          activeColor: Colors.blue,
        )
      ],
    );
  }

  Widget emailFromDominosSelector() {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Checkbox(
              activeColor: Colors.blue,
              value: emailFromDominos,
              onChanged: (bool value) {
                setState(() {
                  emailFromDominos = value;
                });
              },
            ),
          ),
          Container(
              width: 350,
              child: Text(
                  'Yes, I would like to receive email offers from Domino\'s Pizza.')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(Icons.dehaze),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Center(
              child: Text(
            "Checkout",
            style: TextStyle(fontWeight: FontWeight.bold),
          ))),
      body: Container(
        margin: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Order Total: \$${cart.totalAmount} (${widget.orderType})',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                        "Place your below for ${widget.weekDay}, ${widget.formatDate(widget.dateTime)} at ${widget.formatTime(widget.timeDate)} ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    Divider(
                      thickness: 5,
                    ),
                  ],
                ),
              ),
              _buildEmail(),
              _buildPhoneNumber(),
              _buildFirstName(),
              _buildLastName(),
              SizedBox(
                height: 5,
              ),
              Divider(
                thickness: 10,
              ),
              paymentTypeSelector(),
              Divider(
                thickness: 10,
              ),
              emailFromDominosSelector(),
              Container(
                color: Colors.grey[400],
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'Any Delivery Charge is not a tip payed to your driver. Please reward your driver for awesomeness. Our drivers carry less than \$20'),
                    ),
                    Container(
                      width: 380,
                      height: 30,
                      color: Colors.red,
                      child: FlatButton(
                        child: Text(
                          'PLACE YOUR ORDER',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }

                          _formKey.currentState.save();

                          print(_firstName);
                          print(_lastName);
                          print(_email);
                          print(_phoneNumber);
                          print(paymentType);
                          print(emailFromDominos);
                          //Send to API
                        },
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8, top: 4),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'By placing your order you agree to our ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'Terms of Use',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  )),
                              Text(
                                ' and that you',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        Text(
                          'are at least 13 years old.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.lock),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Secure Transaction')
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
