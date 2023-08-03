import { NativeModules, NativeEventEmitter, EmitterSubscription, } from 'react-native';
const { RNCaulyInterstitialAdModule } = NativeModules;
const eventEmitter = new NativeEventEmitter();
export default class CaulyInterstitialAd {
    appCode;
    listeners = [];
    constructor(appCode) {
        this.appCode = appCode;
        RNCaulyInterstitialAdModule.initWithParentViewController(appCode);
    }
    addEventListener(event, handler) {
        const eventHandler = () => {
            handler();
        };
        const listener = eventEmitter.addListener(event, eventHandler);
        this.listeners.push(listener);
        return {
            remove: () => {
                listener.remove();
                const index = this.listeners.indexOf(listener);
                if (index > -1) {
                    this.listeners.splice(index, 1);
                }
            },
        };
    }
    /**
     * Removes all registered event handlers for this ad.
     */
    removeAllListeners() {
        this.listeners.forEach((listener) => listener.remove());
        this.listeners = [];
    }
    async show() {
        return RNCaulyInterstitialAdModule.show();
    }
    /**
     * Destroys the Ad.
     */
    destroy() {
        this.removeAllListeners();
    }
}
