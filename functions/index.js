const {setGlobalOptions} = require("firebase-functions");
const {onCall} = require("firebase-functions/https");

setGlobalOptions({
  maxInstances: 10,
});

exports.testPolyTalkBackend = onCall((request) => {
  return {
    success: true,
    message: "PolyTalk backend is working!",
    timestamp: new Date().toISOString(),
  };
});
