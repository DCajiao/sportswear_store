import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.*;

import java.sql.*;

@SpringBootApplication
@RestController
public class CRUDService {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/nombre_de_tu_base_de_datos";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";

    public static void main(String[] args) {
        SpringApplication.run(CRUDService.class, args);
    }

    @PostMapping("/crear")
    public String createRecord(@RequestParam String value) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD)) {
            String sql = "INSERT INTO tabla (columna) VALUES (?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, value);
                statement.executeUpdate();
                return "Registro creado exitosamente.";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "Error al crear el registro.";
        }
    }

    @GetMapping("/leer")
    public String readRecords() {
        StringBuilder result = new StringBuilder();
        try (Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD)) {
            String sql = "SELECT * FROM tabla";
            try (Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(sql)) {
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String value = resultSet.getString("columna");
                    result.append("ID: ").append(id).append(", Valor: ").append(value).append("\n");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            result.append("Error al leer los registros.");
        }
        return result.toString();
    }

    @PutMapping("/actualizar/{id}")
    public String updateRecord(@PathVariable int id, @RequestParam String newValue) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD)) {
            String sql = "UPDATE tabla SET columna = ? WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, newValue);
                statement.setInt(2, id);
                statement.executeUpdate();
                return "Registro actualizado exitosamente.";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "Error al actualizar el registro.";
        }
    }

    @DeleteMapping("/eliminar/{id}")
    public String deleteRecord(@PathVariable int id) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD)) {
            String sql = "DELETE FROM tabla WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, id);
                statement.executeUpdate();
                return "Registro eliminado exitosamente.";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "Error al eliminar el registro.";
        }
    }
}