package org.example.neonarkintaketracker.entity;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "creatures")
public class Creature {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 120)
    private String name;

    @Column(nullable = false, length = 120)
    private String species;

    @Column(name = "danger_level", nullable = false, length = 30)
    private String dangerLevel;

    @Column(nullable = false, length = 30)
    private String condition;

    @Column(columnDefinition = "TEXT")
    private String notes;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @ManyToOne(optional = false)
    @JoinColumn(name = "habitat_id", nullable = false)
    private Habitat habitat;

    public Creature() {
    }

    public Creature(Long id, String name, String species, String dangerLevel, String condition, String notes, LocalDateTime createdAt, Habitat habitat) {
        this.id = id;
        this.name = name;
        this.species = species;
        this.dangerLevel = dangerLevel;
        this.condition = condition;
        this.notes = notes;
        this.createdAt = createdAt;
        this.habitat = habitat;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getSpecies() {
        return species;
    }

    public String getDangerLevel() {
        return dangerLevel;
    }

    public String getCondition() {
        return condition;
    }

    public String getNotes() {
        return notes;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public Habitat getHabitat() {
        return habitat;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSpecies(String species) {
        this.species = species;
    }

    public void setDangerLevel(String dangerLevel) {
        this.dangerLevel = dangerLevel;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public void setHabitat(Habitat habitat) {
        this.habitat = habitat;
    }
}