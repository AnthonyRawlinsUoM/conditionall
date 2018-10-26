/*
* Copyright (C) 2018  Anthony Rawlins <anthony.rawlins@unimelb.edu.au>
*/

using App.Widgets;
using App.Views;

namespace App.Controllers {

    /**
     * The {@code AppController} class.
     *
     * @since 1.0.0
     */
    public class AppController {

        private Gtk.Application            application;
        private AppView                    app_view;
        private Gtk.HeaderBar              headerbar;
        private Gtk.ApplicationWindow      window { get; private set; default = null; }

        /**
         * Constructs a new {@code AppController} object.
         */
        public AppController (Gtk.Application application) {
            this.application = application;
            this.window = new Window (this.application);
            this.headerbar = new HeaderBar ();
            this.app_view = new AppView ();

            this.window.add (this.app_view);
            this.window.set_default_size (800, 640);
            this.window.set_size_request (800, 640);
            this.window.set_titlebar (this.headerbar);
            this.application.add_window (window);

            Gtk.Settings.get_default ().set ("gtk-application-prefer-dark-theme", true);
        }

        public void activate () {
            window.show_all ();
            app_view.activate ();
        }

        public void quit () {
            window.destroy ();
        }
    }
}