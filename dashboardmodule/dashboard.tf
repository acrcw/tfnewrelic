
resource "newrelic_one_dashboard" "my_dashboard_resource" {
  name = "jobans Infrastructure Dashboard "
  permissions = "public_read_write"

  page {
    name = "Infrastructure Overview"

    widget_markdown {
      title = ""
      row = 1
      column = 1
      height = 6
      width = 4
      text = <<EOT
![New Relic](https://newrelic.com/assets/newrelic/source/NewRelic-logo-bug.png)

#  infrastructure Overview Dashboard
This dashboard shows metrics and events from the infrastructure Service on the Full Stack Observability Platform (FSO) 
    
[Dive deeper into Infrastructure Health and Performance](https://one.newrelic.com/launcher/nr1-core.explorer?pane=eyJuZXJkbGV0SWQiOiJucjEtY29yZS5saXN0aW5nIn0=&sidebars[0]=eyJuZXJkbGV0SWQiOiJucjEtY29yZS5jYXRlZ29yaWVzIiwicm9vdE5lcmRsZXRJZCI6Im5yMS1jb3JlLmxpc3RpbmcifQ)

EOT
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_bar {
      title = "Server CPU"
      row = 1
      column = 5
      height = 6
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(cpuPercent) FROM SystemSample since 3 hours ago facet hostname limit 400
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_line {
      title = "Network I/O"
      row = 1
      column = 9
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(receiveBytesPerSecond), average(transmitBytesPerSecond) FROM NetworkSample SINCE 30 MINUTES AGO TIMESERIES AUTO
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0
      y_axis_left_zero = false

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_billboard {
      title = "Memory Usage"
      row = 4
      column = 9
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(memoryUsedBytes) /1000000 AS 'Avg MB Used', average(memoryFreeBytes)/1000000 AS 'Avg MB Free' FROM SystemSample since 10 minutes ago
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_line {
      title = "System Load"
      row = 7
      column = 1
      height = 3
      width = 8

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(loadAverageOneMinute) , average(loadAverageFiveMinute), average(loadAverageFifteenMinute) FROM SystemSample since 3 hours ago TIMESERIES
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0
      y_axis_left_zero = false

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_bullet {
      title = "Disk Utilization"
      row = 7
      column = 9
      height = 3
      width = 4
      limit = 4
      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT max(diskUsedPercent) as 'Percent Full' FROM StorageSample since 1 minute ago
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_line {
      title = "Disk I/O"
      row = 10
      column = 1
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(readBytesPerSecond), average(writeBytesPerSecond) FROM StorageSample SINCE 30 MINUTES AGO TIMESERIES AUTO
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0
      y_axis_left_zero = false

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_bar {
      title = "Critical Violations grouped by Hosts"
      row = 10
      column = 5
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT count(criticalViolationCount) from SystemSample facet hostname since 30 minutes ago
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_table {
      title = "What is the IPv6 Address of the Host"
      row = 10
      column = 9
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT uniquecount(hostname) FROM NetworkSample SINCE 30 MINUTES AGO facet ipV6Address, hostname
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_bar {
      title = "5 minute Load Average grouped by Host"
      row = 13
      column = 1
      height = 6
      width = 8

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(loadAverageFiveMinute) FROM SystemSample SINCE 30 MINUTES AGO facet hostname
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_table {
      title = "What is the IPv4 Address of the Host"
      row = 13
      column = 9
      height = 6
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT uniquecount(hostname) FROM NetworkSample SINCE 30 MINUTES AGO facet ipV4Address, hostname
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_pie {
      title = "Process Breakdown"
      row = 19
      column = 1
      height = 3
      width = 8

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT count(*), average(threadCount), average(cpuPercent), average(cpuSystemPercent) FROM ProcessSample FACET commandName SINCE 1 hour ago
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_line {
      title = "Top 5 Network Transmitters Timeseries"
      row = 19
      column = 9
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(transmitBytesPerSecond) from NetworkSample FACET hostname LIMIT 5 timeseries
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0
      y_axis_left_zero = false

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_bar {
      title = "MB/sec transmitted grouped by Hostname"
      row = 22
      column = 1
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(transmitBytesPerSecond)/1024/1024 as 'MB/Sec transmitted' FROM NetworkSample SINCE 30 MINUTES AGO facet hostname
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_bar {
      title = "Top 5 CPU Average"
      row = 22
      column = 5
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
select average(cpuPercent) from SystemSample facet hostname limit 5
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_bar {
      title = "Server System Percent"
      row = 22
      column = 9
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(cpuSystemPercent) FROM SystemSample since 3 hours ago facet hostname limit 400
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_billboard {
      title = "Received Packets"
      row = 25
      column = 1
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT count(receivePacketsPerSecond) as 'Packets Per Second' FROM NetworkSample SINCE 1 hour AGO compare with 1 hour ago
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_line {
      title = "Top 5 Disk Consumers Timeseries"
      row = 25
      column = 5
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
select average(diskUsedPercent) from StorageSample facet hostname limit 5 TIMESERIES
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0
      y_axis_left_zero = false

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_bar {
      title = "Infrastructure Events by Hosts"
      row = 25
      column = 9
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT count(*) FROM InfrastructureEvent,StorageSample,SystemSample FACET hostname SINCE 1 month ago LIMIT 25
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_table {
      title = "Top 5 Memory Utilization"
      row = 28
      column = 1
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
select 100 * average(memoryUsedBytes) / (average(memoryFreeBytes) + average(memoryUsedBytes)) as PctUsed from SystemSample facet hostname limit 5
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_line {
      title = "Top 5 CPU Timeseries"
      row = 28
      column = 5
      height = 3
      width = 8

      nrql_query {
        account_id = 4438270
        query = <<EOT
select average(cpuPercent) from SystemSample facet hostname limit 5 timeseries 5 minutes
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0
      y_axis_left_zero = false

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }
  }

  page {
    name = "Health of Hosts"

    widget_table {
      title = "Host Names"
      row = 1
      column = 1
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(cpuPercent), average(memoryUsedBytes / memoryTotalBytes) * 100 AS 'Memory Used Percent' FROM SystemSample FACET hostname SINCE 5 minutes ago
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_line {
      title = "CPU Usage"
      row = 1
      column = 5
      height = 3
      width = 8

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(cpuSystemPercent), average(cpuIOWaitPercent), average(cpuUserPercent), average(cpuStealPercent) from SystemSample SINCE 60 minutes ago    TIMESERIES
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0
      y_axis_left_zero = false

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_line {
      title = "CPU Load"
      row = 4
      column = 1
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(loadAverageOneMinute), average(loadAverageFiveMinute), average(loadAverageFifteenMinute) from SystemSample SINCE 60 minutes ago    TIMESERIES
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0
      y_axis_left_zero = false

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_line {
      title = "Physical Memory"
      row = 4
      column = 5
      height = 3
      width = 8

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(memoryUsedBytes / memoryTotalBytes * 100) AS 'Memory Used Percent', average(memoryFreeBytes / memoryTotalBytes * 100) AS 'Memory Free Percent' FROM SystemSample SINCE 60 minutes ago TIMESERIES
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0
      y_axis_left_zero = false

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_area {
      title = "Disk Total I/O Utilization"
      row = 7
      column = 1
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(totalUtilizationPercent) FROM StorageSample TIMESERIES FACET `entityAndMountPoint` LIMIT 100 SINCE 60 minutes ago
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_line {
      title = "Network I/O (MB/s)"
      row = 7
      column = 5
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(receiveBytesPerSecond / 1024) AS 'Received', average(transmitBytesPerSecond / 1024) AS 'Transmitted' FROM NetworkSample SINCE 60 minutes ago TIMESERIES
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0
      y_axis_left_zero = false

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_table {
      title = "Processes"
      row = 7
      column = 9
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT uniqueCount(processId), latest(userName), average(cpuPercent) AS 'CPU Percent', average(memoryResidentSizeBytes) / 1024000 AS 'Memory (MB)' FROM ProcessSample FACET processDisplayName SINCE 1 hour ago
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }
  }

  page {
    name = "Infrastructure Metrics"

    widget_table {
      title = "System Metrics"
      row = 1
      column = 1
      height = 6
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(cpuPercent), ((average(memoryUsedBytes)/1024)/1024)/1024 as 'Avg Memory Used in GB' FROM SystemSample FACET hostname SINCE 5 minutes ago limit 50
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_bullet {
      title = "CPU Usage"
      row = 1
      column = 5
      height = 3
      width = 4
      limit = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(cpuPercent) as '% CPU Usage' FROM SystemSample SINCE 30 minutes ago
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_bullet {
      title = "Disk Usage"
      row = 1
      column = 9
      height = 3
      width = 4
      limit = 4
      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(diskUsedPercent) as '% Disk Used' FROM StorageSample SINCE 30 minutes ago
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_bullet {
      title = "Memory Usage"
      row = 4
      column = 5
      height = 3
      width = 4
      limit = 4
      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(memoryUsedBytes/memoryTotalBytes)*100 as '% Memory Used' FROM SystemSample SINCE 30 minutes ago
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_billboard {
      title = "System Metrics"
      row = 4
      column = 9
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(cpuPercent) as '% CPU Usage', average(loadAverageOneMinute) as '1 min Load', average(loadAverageFiveMinute) as '5 min Load', average(loadAverageFifteenMinute) as '15 min Load', average(memoryUsedBytes/memoryTotalBytes)*100 as '% Memory Used', average(memoryFreeBytes/memoryTotalBytes)*100 as '% Memory Free' FROM SystemSample SINCE 1 day ago
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_table {
      title = "Process Metrics"
      row = 7
      column = 1
      height = 9
      width = 8

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT processDisplayName, cpuPercent, threadCount, userName, `nr.apmApplicationNames` as 'App Name' FROM ProcessSample since 5 minutes ago until 1 minute ago limit 100
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_billboard {
      title = "Disk Metrics"
      row = 7
      column = 9
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(diskUsedPercent) as '% Disk Used', average(diskFreePercent) as '% Free Disk', max(diskUsedPercent) as '% Max Disk Used', uniqueCount(mountPoint) as 'Mount Points' FROM StorageSample SINCE 1 day ago
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_billboard {
      title = "Network Metrics"
      row = 10
      column = 9
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(receivePacketsPerSecond), average(transmitPacketsPerSecond), average(receiveDroppedPerSecond), average(transmitDroppedPerSecond), average(receiveErrorsPerSecond), average(transmitErrorsPerSecond) FROM NetworkSample since 1 day ago
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_table {
      title = "Disk Usage %"
      row = 13
      column = 9
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(diskUsedPercent) as '% Disk Used', average(diskFreePercent) as '% Disk Free' FROM StorageSample SINCE 30 minutes ago FACET device
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_table {
      title = "Process List"
      row = 19
      column = 1
      height = 6
      width = 12

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT max(cpuPercent), max(ioReadBytesPerSecond), max(ioReadCountPerSecond), max(ioWriteBytesPerSecond), max(ioWriteCountPerSecond), max(threadCount), max(fileDescriptorCount) FROM ProcessSample FACET commandName since 2 minutes ago limit 15
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_line {
      title = "Monthly CPU Usage"
      row = 25
      column = 1
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT 50 as 'Threshold', average(cpuPercent) as '% CPU Usage' FROM SystemSample SINCE 1 month ago TIMESERIES
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0
      y_axis_left_zero = false

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_line {
      title = "Monthly Disk Usage"
      row = 25
      column = 5
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT 50 as 'Threshold', average(diskUsedPercent) as '% Disk Used' FROM StorageSample SINCE 1 month ago TIMESERIES
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0
      y_axis_left_zero = false

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_line {
      title = "Monthly Memory Usage"
      row = 25
      column = 9
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT 50 as 'Threshold', average(memoryUsedBytes/memoryTotalBytes)*100 as '% Memory Used' FROM SystemSample SINCE 1 month ago TIMESERIES
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0
      y_axis_left_zero = false

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_table {
      title = "Daily CPU Usage % | Host Count"
      row = 34
      column = 1
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(cpuPercent), uniquecount(entityName) as 'Host Count' FROM SystemSample FACET instanceType SINCE 1 day ago limit 25 where cpuPercent < 20
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_table {
      title = "Weekly CPU Usage % | Host Count"
      row = 34
      column = 5
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(cpuPercent), uniquecount(entityName) as 'Host Count' FROM SystemSample FACET instanceType SINCE 1 week ago limit 25 where cpuPercent < 20
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_table {
      title = "Monthly CPU Usage % | Host Count"
      row = 34
      column = 9
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(cpuPercent), uniquecount(entityName) as 'Host Count' FROM SystemSample FACET instanceType SINCE 1 month ago limit 25 where cpuPercent < 20
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_billboard {
      title = "Avg CPU Usage - DoD"
      row = 46
      column = 1
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(cpuPercent) FROM SystemSample SINCE 1 day ago COMPARE WITH 1 day ago
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_billboard {
      title = "Avg CPU Usage - WoW"
      row = 46
      column = 5
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(cpuPercent) FROM SystemSample SINCE 1 week ago COMPARE WITH 1 week ago
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_billboard {
      title = "Avg CPU Usage - MoM"
      row = 46
      column = 9
      height = 3
      width = 4

      nrql_query {
        account_id = 4438270
        query = <<EOT
SELECT average(cpuPercent) FROM SystemSample SINCE 1 month ago COMPARE WITH 1 month ago
EOT
      }
      facet_show_other_series = false
      legend_enabled = false
      ignore_time_range = false
      y_axis_left_min = 0
      y_axis_left_max = 0

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }
  }
}
