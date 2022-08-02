const express = require("express");
const app = express();
const port = 8029;

var AWS = require("aws-sdk"),
  region = "us-east-1",
  secretName = "prod/node",
  secret;

var client = new AWS.SecretsManager({
  region: region,
//   accessKeyId: process.env.accessKeyId,
//   secretAccessKey: process.env.secretAccessKey

});
client.getSecretValue({ SecretId: secretName }, function (err, data) {
  if (err) {
  } else {
    if ("SecretString" in data) {
      secret = data.SecretString;

    }
  }
});
app.get("/", (req, res) => {
  const secret_username = JSON.parse(secret)['username'];
 // const secret_username =  secret;
  res.send("Hello World! " + JSON.stringify(JSON.parse(secret)));
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
