const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();
const FieldValue = admin.firestore.FieldValue;

exports.onShipmentUpdate = functions.firestore
    .document('companies/{companyId}/shipments/{shipmentId}')
    .onUpdate(async (change, context) => {
        const newValue = change.after.data();
        const previousValue = change.before.data();

        // Verifica si el estado ha cambiado a 'delivered' o 'cancelled'
        if ((newValue.state === 3 && previousValue.state !== 3) || (newValue.state === 5 && previousValue.state !== 5)) {
            try {
                await new Promise(resolve => setTimeout(resolve, 120000));

                // Cambia el estado a 'archived'
                await change.after.ref.update({ state: 4 });

                // Agrega un registro de acción
                // const actionLog = {
                //     action: 'Archivado automaticamente',
                //     timestamp: FieldValue.serverTimestamp(), // Usa FieldValue
                //     user: 'server'
                // };

                // await change.after.ref.update({
                //     actionLogs: FieldValue.arrayUnion(actionLog) // Usa FieldValue
                // });
            } catch (error) {
                console.error(`Error actualizando el estado del envío ${context.params.shipmentId}:`, error);
            }
        }
    });