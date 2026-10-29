package kz.iitu.studentapi;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
class StudentControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void createStudentReturns201() throws Exception {
        String json = "{\"fullName\":\"Nurshat Sagidullaeva\",\"email\":\"nurshat@example.com\",\"groupName\":\"IT2-23.09\"}";
        mockMvc.perform(post("/api/students").contentType(MediaType.APPLICATION_JSON).content(json))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.fullName").value("Nurshat Sagidullaeva"));
    }

    @Test
    void createStudentWithBlankNameReturns400() throws Exception {
        String json = "{\"fullName\":\"\",\"email\":\"nurshat@example.com\",\"groupName\":\"IT2-23.09\"}";
        mockMvc.perform(post("/api/students").contentType(MediaType.APPLICATION_JSON).content(json))
                .andExpect(status().isBadRequest());
    }

    @Test
    void getNonexistentStudentReturns404() throws Exception {
        mockMvc.perform(get("/api/students/99999"))
                .andExpect(status().isNotFound());
    }
}
