package org.example.neonarkintaketracker.entity;

import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "habitats")
public class Habitat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 40)
    private String biome;

    @Column(nullable = false, length = 120)
    private String location;

    @Column(name = "min_temp_c", nullable = false)
    private Integer minTempC;

    @Column(name = "max_temp_c", nullable = false)
    private Integer maxTempC;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @OneToMany(mappedBy = "habitat")
    private List<Creature> creatures;

    public Habitat() {
    }

    public Habitat(Long id, String biome, String location, Integer minTempC, Integer maxTempC, LocalDateTime createdAt, List<Creature> creatures) {
        this.id = id;
        this.biome = biome;
        this.location = location;
        this.minTempC = minTempC;
        this.maxTempC = maxTempC;
        this.createdAt = createdAt;
        this.creatures = creatures;
    }

    public Long getId() {
        return id;
    }

    public String getBiome() {
        return biome;
    }

    public String getLocation() {
        return location;
    }

    public Integer getMinTempC() {
        return minTempC;
    }

    public Integer getMaxTempC() {
        return maxTempC;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public List<Creature> getCreatures() {
        return creatures;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setBiome(String biome) {
        this.biome = biome;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setMinTempC(Integer minTempC) {
        this.minTempC = minTempC;
    }

    public void setMaxTempC(Integer maxTempC) {
        this.maxTempC = maxTempC;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public void setCreatures(List<Creature> creatures) {
        this.creatures = creatures;
    }
}