/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

const functions = require("firebase-functions");
const admin = require('firebase-admin');
admin.initializeApp();

const firestore = admin.firestore();

exports.onUserStateChange = functions.database.ref('/{uid}/active').onUpdate(
    async (change, context) => {
        const isActive = change.after.val();
        const firestoreRef = firestore.doc(`users/${context.params.uid}`);

        return firestoreRef.update({
            active: isActive,
            lastSeen: Date.now(),
        });
    }
);