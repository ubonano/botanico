// CREa modulo de COMPRAS! Finaliza el feature y comenza uno nuevo



// Agregar nuevo estado (Cancelado) y accion (Cancelar) para los envios. y al cancelarse tiene que esperar 2 minutos (como cuando se termina) y enviar al archivo (tambien tiene que loguear el cancelado )
// Crear configuracion de modulos, por ahora solo de via_shipment, y tener ahi la configuracion de la api, para que lo configure el usuario





// Bloquear la modificacion del la activacion del modulo Empresa

// Revisar que la sesion se mantenga activa siempre
// Crear proceso programaado para que elimine todos los dias los envios archivados de dos meses hacia atras
// Crear los middlewares


// TODO Refactorizar shipment_module_tile_button... separar en widget diferentes cada menu(botton para acceder a las pantallas)

// TODO Crear ABM de lugares de entrega
// TODO Bloquear modulo de trabajadores y empresa

// TODO no funciona la transaccion en operation_helper, si falla la transaccion no hace el rollback
// TODO, resolver que en los navigation helpers, en todos se agrega el metodo TO... no tienen que aclarase en todos, ver como resolverlo
// TODO Agregar al globalHelper las instancias de worker and company service y sacar el operation helper, tal vez instanciarlo diretamente en los servicios
// TODO Extraer el cambio de estado de los via_shipment en un servicio aparte
// TODO refactorizar modulo de WORKER (en general) Inclusive hay que agregar el paginationHelper

// TODO crear un servicio para el porta papeles y que dentro tambien tenga la posiblidad de mostrr snackbakrs si uno quisiera advertir al usuario que se copio algo, por ejemplo

