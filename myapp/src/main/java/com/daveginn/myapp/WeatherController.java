package com.daveginn.myapp;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/weather")
public class WeatherController {

    @GetMapping
    public Map<String, Object> getWeather() {
        Map<String, Object> weather = new HashMap<>();
        weather.put("temperature", 72);
        weather.put("conditions", "Sunny");
        weather.put("humidity", 45);
        weather.put("windSpeed", 8);
        weather.put("location", "San Francisco");
        return weather;
    }
}
