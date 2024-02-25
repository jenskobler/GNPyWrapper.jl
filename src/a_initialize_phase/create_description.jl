
"""
$(TYPEDSIGNATURES)

creates fiber description in julia dictionary format
"""
function fiber_des(original_fiber_object, attr_list,fiber_params_attr_list, py_modules)

    # attr_list_fiber_rm_methods = ["alpha","beta2","beta3", "chromatic_dispersion","cr","gamma", "interpolate_parameter_over_spectrum", "loss_coef_func", "propagate", "update_pref"]


    complete_fiber_description_dict = Dict()
    for i in attr_list
        if i == "params"
            #println("IN PARAMS DES")
            complete_fiber_description_dict[string(i)] = fiberparams_des(
                py_modules["builtins"].getattr(original_fiber_object, string(i)),
                fiber_params_attr_list,
                py_modules
                )

        else
            complete_fiber_description_dict[string(i)] = py_modules["builtins"].getattr(original_fiber_object, string(i))
        end
        
    end

    return complete_fiber_description_dict
end

"""
$(TYPEDSIGNATURES)

creates fiber description in julia dictionary format
"""

# using PythonCall

# numpy_py = pyimport(numpy)

function fiberparams_des(original_fiberparams_object, attr_list, py_modules)

    complete_fiberparams_description_dict = Dict()
    for i in attr_list

        complete_fiberparams_description_dict[string(i)] = py_modules["builtins"].getattr(original_fiberparams_object, string(i))
        
    end

    return complete_fiberparams_description_dict
end


"""
$(TYPEDSIGNATURES)

creates Transceiver description in julia dictionary format
"""
function transceiver_des(original_transceiver_object, attr_list,py_modules)


    transceiver_dict = Dict()

    for i in attr_list

        transceiver_dict[string(i)] = py_modules["builtins"].getattr(original_transceiver_object, string(i))
        
    end

    return transceiver_dict
end

"""
$(TYPEDSIGNATURES)

creates Edfa description in julia dictionary format
"""
function edfa_des(original_edfa_object,attr_list, attr_list_edfa_params, attr_list_edfa_operational, py_modules)


    edfa_dict = Dict()

    for i in attr_list

        if i == "params"

            edfa_dict[string(i)] = edfa_params_des(
                py_modules["builtins"].getattr(original_edfa_object, string(i)),
                attr_list_edfa_params,
                py_modules

            ) 


        elseif i == "operational"
            edfa_dict[string(i)] = edfa_params_des(
                py_modules["builtins"].getattr(original_edfa_object, string(i)),
                attr_list_edfa_operational,
                py_modules)
        else

            edfa_dict[string(i)] = py_modules["builtins"].getattr(original_edfa_object, string(i))
        end
    end

  


    return edfa_dict
end

"""
$(TYPEDSIGNATURES)

creates Edfa description in julia dictionary format
"""
function edfa_operational_des(original_edfa_operational_object, attr_list, py_modules)




    edfa_operational_dict = Dict()

    for i in attr_list

        edfa_operational_dict[string(i)] = py_modules["builtins"].getattr(original_edfa_operational_object, string(i))
        
    end


    return edfa_operational_dict

end 
"""
$(TYPEDSIGNATURES)

creates Edfa description in julia dictionary format
"""
function edfa_params_des(original_edfa_params_object, attr_list, py_modules)

    edfa_params_dict = Dict()

    #TODO original_edfa_params_object.nf_model #TODO # attention! # here must be a dictionary not an object
    
    for i in attr_list

        edfa_params_dict[string(i)] = py_modules["builtins"].getattr(original_edfa_params_object, string(i))
        
    end

    return edfa_params_dict
end

# TODO
# fused, 
# roadm
# spectral information TODO

"""
$(TYPEDSIGNATURES)

creates Edfa description in julia dictionary format
"""
function roadm_des(original_roadm_object)


    roadm_dict = Dict()

    roadm_dict["lat"] = original_roadm_object.lat
    roadm_dict["latitude"] = original_roadm_object.latitude
    roadm_dict["lng"] = original_roadm_object.lng
    roadm_dict["loc"] = original_roadm_object.loc #TODO # attention! # here must be a dictionary not an object
    roadm_dict["location"] = original_roadm_object.location #TODO # attention! # here must be a dictionary not an object
    roadm_dict["loss"] = original_roadm_object.loss
    roadm_dict["metadata"] = original_roadm_object.metadata
    roadm_dict["name"] = original_roadm_object.name
    roadm_dict["operational"] = original_roadm_object.operational
    roadm_dict["params"] = roadm_params_des(original_roadm_object.params) #TODO # attention! # here must be a dictionary not an object
    roadm_dict["passive"] = original_roadm_object.passive
    roadm_dict["per_degree_pch_out_dbm"] = original_roadm_object.per_degree_pch_out_dbm
    roadm_dict["per_degree_pch_psd"] = original_roadm_object.per_degree_pch_psd
    roadm_dict["per_degree_pch_psw"] = original_roadm_object.per_degree_pch_psw
    roadm_dict["propagated_labels"] = original_roadm_object.propagated_labels
    #roadm_dict["ref_carrier"] = roadm_ref_carrier_des(original_roadm_object.ref_carrier) #TODO # attention! # here must be a dictionary not an object
    roadm_dict["ref_effective_loss"] = original_roadm_object.ref_effective_loss
    #roadm_dict["ref_pch_in_dbm"] = original_roadm_object.ref_pch_in_dbm
    roadm_dict["ref_pch_out_dbm"] = original_roadm_object.ref_pch_out_dbm
    roadm_dict["restrictions"] = original_roadm_object.restrictions
    roadm_dict["target_out_mWperSlotWidth"] = original_roadm_object.target_out_mWperSlotWidth
    roadm_dict["target_pch_out_dbm"] = original_roadm_object.target_pch_out_dbm
    roadm_dict["target_psd_out_mWperGHz"] = original_roadm_object.target_psd_out_mWperGHz
    roadm_dict["type_variety"] = original_roadm_object.type_variety
    roadm_dict["uid"] = original_roadm_object.uid

    return roadm_dict

end

"""
$(TYPEDSIGNATURES)

creates Edfa description in julia dictionary format
"""
function roadm_params_des(original_roadm_params_object)

    roadm_params_dict = Dict()

    roadm_params_dict["add_drop_osnr"] = original_roadm_params_object.add_drop_osnr
    roadm_params_dict["pdl"] = original_roadm_params_object.pdl
    roadm_params_dict["per_degree_pch_out_db"] = original_roadm_params_object.per_degree_pch_out_db
    roadm_params_dict["per_degree_pch_psd"] = original_roadm_params_object.per_degree_pch_psd
    roadm_params_dict["per_degree_pch_psw"] = original_roadm_params_object.per_degree_pch_psw
    roadm_params_dict["pmd"] = original_roadm_params_object.pmd
    roadm_params_dict["restrictions"] = original_roadm_params_object.restrictions
    roadm_params_dict["target_out_mWperSlotWidth"] = original_roadm_params_object.target_out_mWperSlotWidth
    roadm_params_dict["target_pch_out_db"] = original_roadm_params_object.target_pch_out_db
    roadm_params_dict["target_psd_out_mWperGHz"] = original_roadm_params_object.target_psd_out_mWperGHz


    return roadm_params_dict
end

"""
$(TYPEDSIGNATURES)

creates Edfa description in julia dictionary format
"""
function roadm_ref_carrier_des(original_roadm_ref_carrier_object)

    roadm_ref_carrier_dict = Dict()

    roadm_ref_carrier_dict["baud_rate"] = original_roadm_ref_carrier_object.baud_rate
    roadm_ref_carrier_dict["slot_width"] = original_roadm_ref_carrier_object.slot_width


    return roadm_ref_carrier_dict
end

"""
$(TYPEDSIGNATURES)

creates Edfa description in julia dictionary format
"""
function fused_des(original_fused_object)

    fused_dict = Dict()

    fused_dict["lat"] = original_fused_object.lat
    fused_dict["latitude"] = original_fused_object.latitude
    fused_dict["lng"] = original_fused_object.lng
    fused_dict["loc"] = original_fused_object.loc
    fused_dict["location"] = original_fused_object.location
    fused_dict["longitude"] = original_fused_object.longitude
    fused_dict["loss"] = original_fused_object.loss
    fused_dict["metadata"] = original_fused_object.metadata
    fused_dict["name"] = original_fused_object.name
    fused_dict["operational"] = original_fused_object.operational
    fused_dict["params"] = fused_params_des(original_fused_object.params) #TODO # attention! # here must be a dictionary not an object
    fused_dict["passive"] = original_fused_object.passive
    fused_dict["uid"] = original_fused_object.uid




    return fused_dict
end

"""
$(TYPEDSIGNATURES)

creates Edfa description in julia dictionary format
"""
function fused_params_des(original_fused_params_object)

    fused_params_dict = Dict()

    fused_params_dict["loss"] = original_fused_params_object.loss


    return fused_params_dict
end