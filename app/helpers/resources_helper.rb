module ResourcesHelper
    def link_to_previous_month(year, month)
        target_year, target_month=  if month == 1
                                        [year - 1, 12]
                                    else
                                        [year, month - 1]
                                    end

        name=   if target_month == 12
                    "#{month_name(target_month)} #{target_year}"
                else
                    "#{month_name(target_month)}"
                end

        link_to name, resources_path(:year=> target_year, :month=> target_month, :resources=> resources)
    end

    def link_to_next_month(year, month, resources= {})
        target_year, target_month=  if month == 12
                                        [year + 1, 1]
                                    else
                                        [year, month + 1]
                                    end

        name=   if target_month == 1
                    "#{month_name(target_month)} #{target_year}"
                else
                    "#{month_name(target_month)}"
                end

        link_to name, resources_path(:year=> target_year, :month=> target_month, :resources=> resources)
    end
end
