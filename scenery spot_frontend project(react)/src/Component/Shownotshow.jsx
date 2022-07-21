import React, { useState } from "react";
import '../Css/Shownotshow.css'


export default function Shownotshow() {
    const [hidden, setHidden] = useState(false);

    return (
        <div>

            {!hidden ? <div className="rotation"> Loading...</div> : null}
            <button onClick={() => setHidden(s => !s)}>
                show /hide
            </button>
        </div>
    );
}