FROM icinga/icinga2 
COPY icinga-config /etc/icinga2 
EXPOSE 80 443 
CMD ["/usr/sbin/icinga2","daemon","-x","debug"]