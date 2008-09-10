# Copyright (c) 2008, Pawel J. Sawicki, pjs@pjs.name
#  
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#  
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

class denyhosts::config {
    file {
        "/etc/hosts.deny":
            owner => "root",
            group => "root",
            mode  => 0600,
    }

    file {
        "/var/lib/denyhosts/allowed-hosts":
            source => "puppet:///denyhosts/allowed-hosts",
            owner  => "root",
            group  => "root",
            mode   => 0600,
    }

    file {
        "/etc/denyhosts.conf":
            content => template("denyhosts/denyhosts.conf.erb"),
            owner   => "root",
            group   => "root",
            mode    => 0600,
            notify  => Service[denyhosts],
    }

    realize Service[denyhosts]
}

