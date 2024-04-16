// Variables globales para almacenar datos temporales
let compraId;

// Función para mostrar el formulario de productos
document.getElementById("iniciarCompraBtn").addEventListener("click", function () {
  fetch('http://localhost:8080/compra', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      costo: 0,
      fecha: new Date().toISOString().split('T')[0]  // Obtener fecha de hoy en formato YYYY-MM-DD
    })
  })
    .then(response => response.json())
    .then(data => {
      compraId = data.compraId; // Almacenar el ID de compra
      document.getElementById("productForm").style.display = "block";
    })
    .catch(error => {
      console.error('Error:', error);
    });
});

//Función para llenar la tabla de productos
// Hay que revisarla !!!
const apiUrl = "http://localhost:8080/producto";

fetch(apiUrl)
  .then(response => response.json())
  .then(data => {
    console.log(data);
    const tabla = document.getElementById("product");
    const tbody = document.getElementById("productos");
    data.forEach(item => {
      const fila = document.createElement("tr");
      const nombre = document.createElement("td");
      nombre.textContent = item.nombre;
      const precio = document.createElement("td");
      precio.textContent = item.precio;
      const descripcion = document.createElement("td");
      descripcion.textContent = item.descripcion;
      const stock = document.createElement("td");
      stock.textContent = item.stock;
      fila.appendChild(nombre);
      fila.appendChild(precio);
      fila.appendChild(descripcion);
      fila.appendChild(stock);
      tbody.appendChild(fila);
    });
  })
  .catch(error => console.error("Error al obtener los datos:", error));




// Función para validar disponibilidad y agregar producto a la compra
document.getElementById("validarDisponibilidadBtn").addEventListener("click", function () {
  const productId = document.getElementById("productId").value;
  const quantity = document.getElementById("quantity").value;

  fetch('http://localhost:8080/producto/' + productId)
    .then(response => response.json())
    .then(data => {
      if (data.disponibilidad >= quantity) {
        fetch('http://localhost:8080/contiene', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            productoIdentificacion: productId,
            compraId: compraId,
            cantidad: quantity
          })
        })
          .then(response => response.json())
          .then(data => {
            console.log('Producto añadido a la compra:', data);
            // Si el producto se añadió correctamente, puedes mostrar un mensaje de éxito o actualizar la tabla de productos en la compra
          })
          .catch(error => {
            console.error('Error:', error);
          });
      } else {
        alert("Cantidad no disponible");
      }
    })
    .catch(error => {
      console.error('Error:', error);
    });
});

// Función para mostrar el formulario de envío y cargar la tabla de lugares disponibles
// Puedes llamar a esta función cuando sea relevante para tu flujo de usuario
function mostrarFormularioEnvio() {
  document.getElementById("shippingForm").style.display = "block";

  fetch('http://localhost:8080/lugar')
    .then(response => response.json())
    .then(data => {
      // Construir tabla de lugares disponibles
      let placeTableHTML = "<h3>Lugares Disponibles para Envío</h3><table><tr><th>ID</th><th>Nombre</th><th>Dirección</th></tr>";
      data.forEach(place => {
        placeTableHTML += `<tr><td>${place.id}</td><td>${place.nombre}</td><td>${place.direccion}</td></tr>`;
      });
      placeTableHTML += "</table>";
      document.getElementById("placeTable").innerHTML = placeTableHTML;
      document.getElementById("placeTable").style.display = "block";
    })
    .catch(error => {
      console.error('Error:', error);
    });
}

// Función para confirmar la compra
document.getElementById("confirmBtn").addEventListener("click", function () {
  fetch('http://localhost:8080/compra/' + compraId, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      estado: 'confirmada'
    })
  })
    .then(response => response.json())
    .then(data => {
      console.log('Compra confirmada:', data);
      // Aquí puedes mostrar un mensaje de confirmación o redirigir al usuario a una página de confirmación
    })
    .catch(error => {
      console.error('Error:', error);
    });
});

// Función para cancelar la compra
document.getElementById("cancelBtn").addEventListener("click", function () {
  fetch('http://localhost:8080/compra/' + compraId, {
    method: 'DELETE'
  })
    .then(response => {
      console.log('Compra cancelada');
      // Aquí puedes mostrar un mensaje de cancelación o redirigir al usuario a la página de inicio
    })
    .catch(error => {
      console.error('Error:', error);
    });
});
