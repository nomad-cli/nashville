module Nashville
  class Software < Entity(:software)
    media :software
    attributes :softwareDeveloper

    class IPadSoftware < Entity(:iPadSoftware)
    end

    class MacSoftware < Entity(:macSoftware)
    end
  end
end
