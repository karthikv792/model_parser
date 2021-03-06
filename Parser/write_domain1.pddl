
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Domain file automatically generated by the Tarski FSTRIPS writer
;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain test_domain)
    (:requirements :action-costs)
    (:types
        agents - object
        location - object
        police - agents
        fire - agents
        transport - agents
        medic - agents
        hospital - location
        policestation - location
        firestation - location
        pois - location
    )

    (:constants
        
    )

    (:predicates
        (alerted ?x1 - location)
        (updated ?x1 - agents)
        (deployed_police_cars ?x1 - location)
        (deployed_engines ?x1 - location)
        (deployed_small_engines ?x1 - location)
        (deployed_big_engines ?x1 - location)
        (deployed_ladders ?x1 - location)
        (deployed_bulldozers ?x1 - location)
        (deployed_helicopters ?x1 - location)
        (deployed_rescuers ?x1 - location)
        (deployed_ambulances ?x1 - location)
        (positioned_policemen ?x1 - location)
        (media_contacted ?x1 - agents)
        (active_helpline ?x1 - agents)
        (active_local_alert ?x1 - agents)
        (blocked_road ?x1 - location ?x2 - location)
        (traffic_diverted ?x1 - location ?x2 - location)
        (prepared_evacuation ?x1 - location)
        (evacuated ?x1 - location ?x2 - location)
        (extinguished_fire ?x1 - location)
        (fire_at ?x1 - location)
        (small_fire_at ?x1 - location)
        (barricaded ?x1 - location)
        (searched ?x1 - location)
        (attended_casualties ?x1 - location)
        (addressed_media )
        (needed_barricade ?x1 - location)
        (needed_active_local_alert ?x1 - agents)
        (needed_diverted_traffic ?x1 - location ?x2 - location)
        (needed_search_casualties ?x1 - location)
        (needed_attend_casualties ?x1 - location)
        (needed_address_media )
        (not_needed_barricade ?x1 - location)
        (not_needed_active_local_alert ?x1 - agents)
        (not_needed_diverted_traffic ?x1 - location ?x2 - location)
        (not_needed_search_casualties ?x1 - location)
        (not_needed_attend_casualties ?x1 - location)
        (not_needed_address_media )
        (has_police_car_number ?x1 - location)
        (has_small_engines_number ?x1 - location)
        (has_big_engines_number ?x1 - location)
        (has_ladders_number ?x1 - location)
        (has_helicopters_number ?x1 - location)
        (has_rescuers_number ?x1 - location)
        (has_ambulances_number ?x1 - location)
        (has_policemen_number ?x1 - location)
        (has_bulldozers_number ?x1 - location)
    )

    (:functions
        (duration_unit_actions ) - number
        (duration_deploy_police_cars ) - number
        (duration_deploy_small_engines ) - number
        (duration_deploy_big_engines ) - number
        (duration_deploy_ladders ) - number
        (duration_deploy_bulldozers ) - number
        (duration_deploy_helicopters ) - number
        (duration_deploy_rescuers ) - number
        (duration_deploy_ambulances ) - number
        (duration_position_policemen ) - number
        (duration_contact_media ) - number
        (duration_set_up_helpline ) - number
        (duration_issue_local_alert ) - number
        (duration_block_road ) - number
        (duration_prepare_evacuation ) - number
        (duration_evacuation ) - number
        (duration_extinguish_small_fire ) - number
        (duration_extinguish_big_fire ) - number
        (duration_barricade ) - number
        (duration_search_casualties ) - number
        (duration_attend_casualties ) - number
        (duration_address_media ) - number
        (total-cost ) - number
    )

    

    
    (:action alert
     :parameters (?a - agents ?loc - location)
     :precondition (and )
     :effect (and
        (alerted ?loc))
    )


    (:action update
     :parameters (?a - agents)
     :precondition (and )
     :effect (and
        (updated ?a))
    )


    (:action deploy_police_cars
     :parameters (?a - police ?from - policestation ?to - pois)
     :precondition (and (alerted ?from) (has_police_car_number ?from))
     :effect (and
        (deployed_police_cars ?to)
        (not (alerted ?from))
        (not (has_police_car_number ?from)))
    )


    (:action deploy_small_engines
     :parameters (?a - fire ?from - firestation ?to - pois)
     :precondition (and (alerted ?from) (has_small_engines_number ?from))
     :effect (and
        (deployed_engines ?to)
        (deployed_small_engines ?to)
        (needed_barricade ?to)
        (not (alerted ?from))
        (not (not_needed_barricade ?to))
        (not (has_small_engines_number ?from)))
    )


    (:action deploy_big_engines
     :parameters (?a - fire ?from - firestation ?to - pois)
     :precondition (and (alerted ?from) (has_big_engines_number ?from))
     :effect (and
        (deployed_engines ?to)
        (deployed_big_engines ?to)
        (needed_barricade ?to)
        (not (alerted ?from))
        (not (not_needed_barricade ?to))
        (not (has_big_engines_number ?from)))
    )


    (:action deploy_ladders
     :parameters (?a - fire ?from - firestation ?to - pois)
     :precondition (and (alerted ?from) (and (deployed_big_engines ?to) (has_ladders_number ?from)))
     :effect (and
        (deployed_ladders ?to)
        (not (alerted ?from))
        (not (has_ladders_number ?from)))
    )


    (:action deploy_bulldozers
     :parameters (?a - fire ?from - firestation ?to - pois)
     :precondition (and (alerted ?from) (has_bulldozers_number ?from))
     :effect (and
        (deployed_bulldozers ?to)
        (not (alerted ?from))
        (not (has_bulldozers_number ?from)))
    )


    (:action deploy_helicopters
     :parameters (?a - fire ?from - firestation ?to - pois)
     :precondition (and (alerted ?from) (has_helicopters_number ?from))
     :effect (and
        (deployed_helicopters ?to)
        (not (alerted ?from))
        (not (has_helicopters_number ?from)))
    )


    (:action deploy_rescuers
     :parameters (?a - fire ?from - firestation ?to - pois)
     :precondition (and (alerted ?from) (has_rescuers_number ?from))
     :effect (and
        (deployed_rescuers ?to)
        (not (alerted ?from))
        (not (has_rescuers_number ?from)))
    )


    (:action deploy_ambulances
     :parameters (?a - police ?from - hospital ?to - pois)
     :precondition (and (alerted ?from) (has_ambulances_number ?from))
     :effect (and
        (deployed_ambulances ?to)
        (not (alerted ?from))
        (not (has_ambulances_number ?from)))
    )


    (:action position_policemen
     :parameters (?a - police ?from - policestation ?to - pois)
     :precondition (and (alerted ?from) (has_policemen_number ?from))
     :effect (and
        (positioned_policemen ?to)
        (not (alerted ?from)))
    )


    (:action contact_media
     :parameters (?a - agents)
     :precondition (and )
     :effect (and
        (media_contacted ?a))
    )


    (:action set_up_helpline
     :parameters (?a - agents)
     :precondition (media_contacted ?a)
     :effect (and
        (active_helpline ?a))
    )


    (:action issue_local_alert
     :parameters (?a - agents)
     :precondition (media_contacted ?a)
     :effect (and
        (active_local_alert ?a)
        (not_needed_active_local_alert ?a)
        (not (needed_active_local_alert ?a)))
    )


    (:action block_road
     :parameters (?a - transport ?from - location ?to - location)
     :precondition (and (active_local_alert ?a) (and (positioned_policemen ?to) (and (deployed_police_cars ?to) (and (positioned_policemen ?from) (deployed_police_cars ?from)))))
     :effect (and
        (blocked_road ?from ?to)
        (needed_diverted_traffic ?from ?to)
        (needed_active_local_alert ?a)
        (not (not_needed_diverted_traffic ?from ?to))
        (not (not_needed_active_local_alert ?a)))
    )


    (:action divert_traffic
     :parameters (?a - transport ?from - location ?to - location)
     :precondition (and (active_local_alert ?a) (blocked_road ?from ?to))
     :effect (and
        (traffic_diverted ?from ?to)
        (not_needed_diverted_traffic ?from ?to)
        (not (needed_diverted_traffic ?from ?to)))
    )


    (:action prepare_evacuation
     :parameters (?a - police ?from - location)
     :precondition (active_local_alert ?a)
     :effect (and
        (prepared_evacuation ?from))
    )


    (:action evacuate
     :parameters (?a - police ?from - location ?to - location)
     :precondition (and (prepared_evacuation ?from) (and (positioned_policemen ?from) (and (deployed_police_cars ?from) (blocked_road ?from ?to))))
     :effect (and
        (evacuated ?from ?to))
    )


    (:action extinguish_small_fire
     :parameters (?a - fire ?at - pois)
     :precondition (and (fire_at ?at) (and (small_fire_at ?at) (deployed_engines ?at)))
     :effect (and
        (extinguished_fire ?at)
        (needed_address_media )
        (needed_search_casualties ?at)
        (not (fire_at ?at))
        (not (small_fire_at ?at))
        (not (not_needed_address_media ))
        (not (not_needed_search_casualties ?at)))
    )


    (:action extinguish_big_fire
     :parameters (?a - fire ?at - pois)
     :precondition (and (fire_at ?at) (deployed_big_engines ?at))
     :effect (and
        (extinguished_fire ?at)
        (needed_search_casualties ?at)
        (not (fire_at ?at))
        (not (not_needed_search_casualties ?at)))
    )


    (:action barricade
     :parameters (?a - fire ?at - pois)
     :precondition (deployed_engines ?at)
     :effect (and
        (barricaded ?at)
        (needed_active_local_alert ?a)
        (not_needed_barricade ?at)
        (not (not_needed_active_local_alert ?a))
        (not (needed_barricade ?at)))
    )


    (:action search_casualties
     :parameters (?a - fire ?at - pois)
     :precondition (and (extinguished_fire ?at) (and (deployed_bulldozers ?at) (and (deployed_helicopters ?at) (deployed_rescuers ?at))))
     :effect (and
        (searched ?at)
        (needed_attend_casualties ?at)
        (needed_address_media )
        (not (not_needed_attend_casualties ?at))
        (not (not_needed_address_media )))
    )


    (:action attend_casualties
     :parameters (?a - medic ?at - pois)
     :precondition (and (needed_attend_casualties ?at) (deployed_ambulances ?at))
     :effect (and
        (attended_casualties ?at)
        (not_needed_attend_casualties ?at)
        (needed_address_media )
        (not (needed_attend_casualties ?at))
        (not (not_needed_address_media )))
    )


    (:action address_media
     :parameters (?a - agents)
     :precondition (and (media_contacted ?a) (needed_address_media ))
     :effect (and
        (addressed_media )
        (not_needed_address_media )
        (not (needed_address_media )))
    )

)