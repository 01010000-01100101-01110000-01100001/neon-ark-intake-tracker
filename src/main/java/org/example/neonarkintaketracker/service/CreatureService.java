package org.example.neonarkintaketracker.service;

import org.example.neonarkintaketracker.dto.CreatureRequest;
import org.example.neonarkintaketracker.dto.CreatureResponse;
import org.example.neonarkintaketracker.entity.Creature;
import org.example.neonarkintaketracker.entity.Habitat;
import org.example.neonarkintaketracker.exception.NotFoundException;
import org.example.neonarkintaketracker.repository.CreatureRepository;
import org.example.neonarkintaketracker.repository.HabitatRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class CreatureService {

    private final CreatureRepository creatureRepository;
    private final HabitatRepository habitatRepository;

    public CreatureService(CreatureRepository creatureRepository, HabitatRepository habitatRepository) {
        this.creatureRepository = creatureRepository;
        this.habitatRepository = habitatRepository;
    }

    public List<CreatureResponse> getAllCreatures() {
        return creatureRepository.findAll()
                .stream()
                .map(this::toResponse)
                .toList();
    }

    public CreatureResponse getCreatureById(Long id) {
        Creature creature = creatureRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("Creature not found with id: " + id));

        return toResponse(creature);
    }

    public CreatureResponse createCreature(CreatureRequest request) {
        Habitat habitat = habitatRepository.findById(request.habitatId())
                .orElseThrow(() -> new NotFoundException("Habitat not found with id: " + request.habitatId()));

        Creature creature = new Creature();
        creature.setName(request.name());
        creature.setSpecies(request.species());
        creature.setDangerLevel(request.dangerLevel());
        creature.setCondition(request.condition());
        creature.setNotes(request.notes());
        creature.setCreatedAt(LocalDateTime.now());
        creature.setHabitat(habitat);

        Creature saved = creatureRepository.save(creature);
        return toResponse(saved);
    }

    private CreatureResponse toResponse(Creature creature) {
        return new CreatureResponse(
                creature.getId(),
                creature.getName(),
                creature.getSpecies(),
                creature.getDangerLevel(),
                creature.getCondition(),
                creature.getNotes(),
                creature.getHabitat().getId(),
                creature.getCreatedAt().toString()
        );
    }
}