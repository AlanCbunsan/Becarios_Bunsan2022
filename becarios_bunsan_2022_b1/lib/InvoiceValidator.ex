defmodule InoviceValidator do
    @secs_in_min  60
    @secs_in_hour 60 * @secs_in_min

    def validate_dates(%DateTime{} = emisor_dt, %DateTime{} = pac_dt) do
      case DateTime.compare(emisor_dt, pac_dt)do
         :eq -> :succes
         :lt ->
           upper_bound_emisor_dt = DateTime.add(emisor_dt, 72 * @secs_in_hour, :second)
           case DateTime.compare(upper_bound_emisor_dt, pac_dt) do
              :eq -> :succes
              :gt -> :succes
              :lt -> {:fail, :before_72_hours}
            end
         :gt ->
           upper_bound_emisor_dt = DateTime.add(emisor_dt, -5 * @secs_in_min, :second)
           case DateTime.compare(upper_bound_emisor_dt, pac_dt) do
              :eq -> :succes
              :gt -> {:fail, :after_5_min}
              :lt -> :succes
            end
        end
    end
end