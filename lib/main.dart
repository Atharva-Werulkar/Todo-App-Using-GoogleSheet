import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

//create Credential
const _credentials = r'''
{
  "type": "service_account",
  "project_id": "todo-application-392002",
  "private_key_id": "92a33cf064170a058ce096f6d491e123e45fcac7",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCil10zWqQA1akj\noWygBl8+1IqPedh+rpIkURAzS3X9MNwhnEfLDEMlUs6UxmqsyczW9BR7BreFDth0\nOIrDYj+akENFLQsDrPSastCD6nzdf9tTY5L+c9JTIZCfpofpu0jR86B5KyhZWM3q\nNGA7DPDcjtGOfVql2Ro4yHPit4q/mJNFR9rxzwOrC7wYcmLwjYXibo4G4DTRHX48\ndyWQPE6HHYsV6foXS5RK8XOLkwy1vp3m07jZbtjjjRltfc0IN3bmkQz5JojTbuOj\npomX13UeIWWBItjgOdjL+72Gv1p5HdBa5WkfkgM351qJenwIWIXe0b5GLqgo536C\nkXkjGGhpAgMBAAECggEAGqTKQZWbZYWdy3hy+ABDUGT89ckGSLArw6bDDFzTz3NX\nx2w4OZZfVHju4GNpbLo/BoSF7KkrnrLRlq4DU0RA3v+//lCEywvnI4ik8dEVuChx\nFQeuuWLadwP7kqX0BMHLi5gsVl7TpFyQlc4SbOrQd5wxy/NPzPi4OtDiaKciJgZE\nUeuidcJHNXeY8SBIIxSF35vMY8BquC/gPfvEXEdFCKvZFSJ4eNsQsk7UVFIJCPOA\nhhOWpxUn1SqNKakLOK2T+9UNkBlGDbC697u+Kl03j3DBzcQWpMfcVSBarne1HfoP\nW9NE0jaaZTZTKi7jBYu+1cSJ4X/0rWC1a9mTpyRsrwKBgQDNaPEqYQcuEuzJa9Q9\nnjwhtwrUP49XmGcE+eWzOnKKSqFRuJJrePdNXSHuPW2ZJu4pP8b+rtuIplSITC8e\nAQLtdawkOKSWJvxeCGgu7JMv4osEghkpjeFXSFMKqG/w23ybqbIFnlOtZBvwVuM+\nxL0SsG9ukl4G/ItOD7hR6k7QAwKBgQDKoraT7XpaKL77PQrQP++ERm3F7CYmBJox\nRmHDkkKXDd/VdpKNPXQrh/QYfyKSDtTOezXaV64YufnU1bDTDYbg9ifGb0YyP5Z9\nD8dfflYXL/ibN9gzbkVcpnsRIAUrYl25/iTwmQ8HFd28l0ETIiUyPH+p0XLTagqr\nspnadfCoIwKBgCQI2e3uUZ0iksmPEg+xN6lOfCbZ86KRSNlVoZc8lKVwDDbS41TZ\nRsEaqn4p5pUsgDFaT+WT9U1WqJO0kbt4v/O6ZfWAvlbdBf7VCLnapMOMwYiL7jAd\nBMAUHwVKoUCmsIh6T5Guwc00N7aE956mUuj5bMMACGC/YwzRsysjqKnTAoGAUztI\ncTR/KB9Katnk4isQz606E6zu8ni7ePfm2jTuYytQwFZm1drjJ6o9Kf62jXXIFVPo\nh9mx6fgh1Tk820PYHfkd11UHaUZTIuVjSCcVZ4rNu7vRczadCPRc4mjblrldtDLe\nq3DDCm8B2B/sm9ZPnvXYnkEowAvzfBjtNx1wjy8CgYEAtBk/ZmuGpTovgqYJ6NBY\n5kyAis+M39iF69Oqstm4NqZ5XN6TDtXlK+EXcey+VeF1LA96/VKjoIHD/L9tvBWD\nWy8wj1bi+I72hYkyUJCKgCjjKgWqND78KLeOgj7RChqZqmDBQA0Fk1oY7WELqeQ2\n+1jumJXbgGhvh77URpR9lwk=\n-----END PRIVATE KEY-----\n",
  "client_email": "todo-application@todo-application-392002.iam.gserviceaccount.com",
  "client_id": "107218075720698985220",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/todo-application%40todo-application-392002.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

''';

const _spreadsheetId = '1272c8vYovUF-uZ9b-J8Qv0uaVNCNyMhhNl4BujEqPxE';

void main() async {
  //initialize the GoogleSheets class

  final gsheet = GSheets(_credentials);

  //fetch the spreadsheet by its id

  final ss = await gsheet.spreadsheet(_spreadsheetId);

  //get the worksheet by its title
  var sheet = ss.worksheetByTitle('Worksheet1');

  //update cell at row 1, column 1
  await sheet?.values.insertValue('Hello World', column: 1, row: 1);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
